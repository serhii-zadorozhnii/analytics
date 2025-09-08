import 'package:analytics/analytics/models/analytics_event.dart';
import 'package:analytics/analytics/service_imp/base_event_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class FirebaseEventService implements BaseEventService {
  FirebaseEventService();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  Future<void> logEvent(AnalyticsEvent event) async {
    final params = event.toJson();
    await _analytics.logEvent(
      name: event.eventTitle,
      parameters: params.isNotEmpty ? params.cast<String, Object>() : null,
    );
  }

  @override
  Future<void> init({bool loggingEnabled = true, bool consoleLoggingEnabled = kDebugMode}) async {
    //no need
  }
}
