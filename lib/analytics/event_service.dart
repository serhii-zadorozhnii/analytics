import 'dart:async';

import 'package:analytics/analytics/avirise_log_service.dart';
import 'package:analytics/analytics/event_helper.dart';
import 'package:analytics/analytics/models/analytics_event.dart';
import 'package:analytics/analytics/models/user_properties.dart';
import 'package:analytics/analytics/properties_helper.dart';
import 'package:analytics/analytics/service_imp/base_event_service.dart';
import 'package:logger/logger.dart';

class EventService {
  EventService();

  final AviriseLogService _aviriseLogService = AviriseLogService();
  late final EventHelper _helper;
  late final PropertiesHelper _propertiesHelper;

  UserProperties get propertiesState => _propertiesHelper.propertiesState;

  final Set<BaseEventService> _services = {};

  bool _aviriseLoggingEnabled = true;
  bool _consoleLoggingEnabled = true;
  bool _inited = false;

  Future<void> init({
    required List<BaseEventService> services,
    bool aviriseLoggingEnabled = const bool.fromEnvironment('AVIRISE_LOGGER_ENABLE'),
    bool consoleLoggingEnabled = true,
  }) async {
    _inited = true;
    _helper = EventHelper(this);
    _propertiesHelper = PropertiesHelper(this);
    _aviriseLoggingEnabled = aviriseLoggingEnabled;
    _consoleLoggingEnabled = consoleLoggingEnabled;
    for (final elem in services) {
      _services.add(elem);
      await elem.init();
    }
    await _propertiesHelper.init();
    await _helper.init();
  }

  Future<void> logEvent(AnalyticsEvent event) async {
    if (!_inited) throw Exception('[Analytics]: Service did not init');
    final params = event.toJson();

    for (final elem in _services) {
      await elem.logEvent(event);
    }

    if (_aviriseLoggingEnabled) {
      unawaited(_aviriseLogService.sendLog(event));
    }
    if (_consoleLoggingEnabled) {
      Logger().i(
        '[Analytics] Event logged: ${event.title}, params: ${params.isNotEmpty ? params : 'none'}',
      );
    }
  }

  Future<void> emitUserProperties(UserProperties properties, {bool setOnce = false}) async {
    if (!_inited) throw Exception('[Analytics]: Service did not init');

    _propertiesHelper.updateProperties(properties);

    for (final elem in _services) {
      await elem.identifyProperties(properties, setOnce: setOnce);
    }

    if (_consoleLoggingEnabled) {
      Logger().i('[Analytics] User properties ${setOnce ? 'setOnce' : 'set'}: $properties');
    }
  }

  Future<void> incrementConversationMessage() => _propertiesHelper.incrementConversationMessage();

  Future<void> incrementVoiceTranslations() => _propertiesHelper.incrementVoiceTranslations();

  Future<void> incrementTextTranslations() => _propertiesHelper.incrementTextTranslations();
}
