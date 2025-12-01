import 'package:analytics/analytics/models/analytics_event.dart';
import 'package:analytics/analytics/models/user_properties.dart';
import 'package:flutter/foundation.dart';

abstract class BaseEventService {
  Future<void> init({bool loggingEnabled = true, bool consoleLoggingEnabled = kDebugMode});

  Future<void> logEvent(AnalyticsEvent event);

  Future<void> identifyProperties(UserProperties properties, {bool setOnce = false});
}
