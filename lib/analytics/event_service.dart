import 'package:analytics/analytics/models/analytics_event.dart';
import 'package:analytics/analytics/avirise_log_service.dart';
import 'package:analytics/analytics/service_imp/base_event_service.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class EventService {
  EventService();

  final AviriseLogService _aviriseLogService = AviriseLogService();

  final Set<BaseEventService> _services = {};

  bool _aviriseLoggingEnabled = true;
  bool _consoleLoggingEnabled = true;
  bool _inited = false;

  Future<void> init({
    required List<BaseEventService> services,
    bool aviriseLoggingEnabled = true,
    bool consoleLoggingEnabled = kDebugMode,
  }) async {
    _inited = true;
    _aviriseLoggingEnabled = aviriseLoggingEnabled;
    _consoleLoggingEnabled = consoleLoggingEnabled;
    for (final elem in services) {
      _services.add(elem);
      await elem.init();
    }
  }

  Future<void> logEvent(AnalyticsEvent event) async {
    if(!_inited) throw Exception('[Analytics]: Service did not init');
    final params = event.toJson();


    for (final elem in _services) {
      elem.logEvent(event);
    }

    // Log to custom API
    if (_aviriseLoggingEnabled) {
      _aviriseLogService.sendLog(event);
    }
    if (_consoleLoggingEnabled) {
      Logger().i(
        '[Analytics] Event logged: ${event.title}, params: ${params.isNotEmpty ? params : 'none'}',
      );
    }
  }
}
