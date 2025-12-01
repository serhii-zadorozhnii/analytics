import 'dart:async';
import 'dart:convert';

import 'package:analytics/analytics/event_service.dart';
import 'package:analytics/analytics/models/user_properties.dart';
import 'package:analytics/analytics/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertiesHelper {
  PropertiesHelper(this._eventService);

  final EventService _eventService;
  late UserProperties _propertiesState;

  UserProperties get propertiesState => _propertiesState;

  late final SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    await _initUserProperties();
  }

  void updateProperties(UserProperties properties) {
    _propertiesState = properties;
    _preferences.setString(Constants.fullUserPropertiesKey, jsonEncode(properties.toJson()));
  }

  Future<void> _initUserProperties() async {
    final userProperty = _parseLocalProperties();
    if (userProperty != null) {
      updateProperties(userProperty);
      return;
    } else {
      final firstDateOpen =
          DateTime.tryParse(_preferences.getString(Constants.firstOpenKey) ?? '') ??
          DateTime.now().toLocal();
      updateProperties(
        UserProperties(
          cohortDay: _dayOfYear(firstDateOpen),
          cohortWeek: _isoWeekNumber(firstDateOpen),
          cohortMonth: firstDateOpen.month,
          cohortYear: firstDateOpen.year,
          userType: UserType.free,
          attPermissionStatus: PermissionStatus.denied,
          cameraPermissionStatus: PermissionStatus.denied,
          microphonePermissionStatus: PermissionStatus.denied,
          speechRecognitionPermissionStatus: PermissionStatus.denied,
          mode: AppThemeMode.light,
          proQuality: ProQualityMode.off,
          conversationMessagesSent: 0,
          totalVoiceTranslations: 0,
          totalTextTranslations: 0,
        ),
      );
    }
    await _eventService.emitUserProperties(propertiesState);
  }

  UserProperties? _parseLocalProperties() {
    try {
      final userPropertiesMap = _preferences.getString(Constants.fullUserPropertiesKey);
      if (userPropertiesMap != null && userPropertiesMap.isNotEmpty) {
        final params = jsonDecode(userPropertiesMap);
        return UserProperties.fromJson(params);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  int _dayOfYear(DateTime date) {
    final startOfYear = DateTime.utc(date.year, 1, 1);
    return date.toUtc().difference(startOfYear).inDays + 1;
  }

  int _isoWeekNumber(DateTime date) {
    final utcDate = date.toUtc();
    final year = utcDate.year;

    // Кількість днів від початку року до вказаної дати
    final daysFromJan1 = utcDate.difference(DateTime.utc(year, 1, 1)).inDays;

    // День року для 4 січня (завжди в першому тижні)
    final jan4DayOfYear = 3; // 0-based: 1 січня = 0

    // День тижня 4 січня (1=Mon ... 7=Sun)
    final jan4Weekday =
        (daysFromJan1 + jan4DayOfYear + DateTime.utc(year, 1, 1).weekday - 1) % 7 + 1;

    // Зміщення до першого четверга року
    final daysToFirstThursday = (4 - jan4Weekday + 7) % 7;

    final dayOfYearForThursday = daysFromJan1 + (4 - utcDate.weekday + 7) % 7;

    final week = ((dayOfYearForThursday - daysToFirstThursday) / 7).floor() + 1;

    return week < 1 ? _isoWeekNumber(DateTime.utc(year - 1, 12, 28)) : week;
  }

  Future<void> incrementConversationMessage() async {
    final properties = propertiesState.copyWith(
      conversationMessagesSent: propertiesState.conversationMessagesSent + 1,
    );
    unawaited(_eventService.emitUserProperties(properties));
  }

  Future<void> incrementVoiceTranslations() async {
    final properties = propertiesState.copyWith(
      totalVoiceTranslations: propertiesState.totalVoiceTranslations + 1,
    );
    unawaited(_eventService.emitUserProperties(properties));
  }

  Future<void> incrementTextTranslations() async {
    final properties = propertiesState.copyWith(
      totalTextTranslations: propertiesState.totalTextTranslations + 1,
    );
    unawaited(_eventService.emitUserProperties(properties));
  }
}
