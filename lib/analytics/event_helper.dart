import 'dart:async';
import 'dart:io';

import 'package:analytics/analytics/event_service.dart';
import 'package:analytics/analytics/models/analytics_event.dart';
import 'package:analytics/analytics/utils/constants.dart';
import 'package:analytics/analytics/utils/permission_extentions.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Additional incapsulate logic
class EventHelper {
  EventHelper(this._eventService);

  late final SharedPreferences _preferences;
  final EventService _eventService;

  Future<void> init() async {
    await _checkAttPermission();
    _preferences = await SharedPreferences.getInstance();
    _firstOpen();
    _sessionStart();
  }

  Future<void> _checkAttPermission() async {
    if (Platform.isIOS) {
      unawaited(_eventService.logEvent(const AnalyticsEvent.attPermissionShown()));

      final status = await AppTrackingTransparency.requestTrackingAuthorization();
      final result = status.toAnalyticsStatus();
      unawaited(
        _eventService.emitUserProperties(
          _eventService.propertiesState.copyWith(attPermissionStatus: status.toPropertiesStatus()),
        ),
      );
      unawaited(_eventService.logEvent(AnalyticsEvent.attPermissionTapped(response: result.name)));
    }
  }

  void _firstOpen() {
    final firstDateOpen = DateTime.tryParse(_preferences.getString(Constants.firstOpenKey) ?? '');
    if (firstDateOpen == null) {
      _eventService.logEvent(const AnalyticsEvent.firstOpen());
    }
    _preferences.setString(Constants.firstOpenKey, DateTime.now().toLocal().toIso8601String());
  }

  void _sessionStart() {
    _eventService.logEvent(const AnalyticsEvent.sessionStart());
  }
}
