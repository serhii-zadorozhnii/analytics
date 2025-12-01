import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:amplitude_flutter/events/identify.dart';
import 'package:analytics/analytics/models/analytics_event.dart';
import 'package:analytics/analytics/models/user_properties.dart';
import 'package:analytics/analytics/service_imp/base_event_service.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AmplitudeEventService implements BaseEventService {
  AmplitudeEventService({required this.apiKey}) {
    _amplitude = Amplitude(Configuration(apiKey: apiKey));
  }

  final String apiKey;

  late final Amplitude _amplitude;

  @override
  Future<void> logEvent(AnalyticsEvent event) async {
    final params = event.toJson();
    return _amplitude.track(
      BaseEvent(event.eventTitle, eventProperties: params.isNotEmpty ? params : null),
    );
  }

  @override
  Future<void> init({bool loggingEnabled = true, bool consoleLoggingEnabled = kDebugMode}) async {
    await _amplitude.isBuilt;
    if (consoleLoggingEnabled) {
      Logger().i('[AmplitudeEventService]: init');
    }
  }

  @override
  Future<void> identifyProperties(UserProperties properties, {bool setOnce = false}) async {
    final identify = Identify();
    properties.toJson().forEach((key, value) {
      if (setOnce) {
        identify.setOnce(key, value);
      } else {
        identify.set(key, value);
      }
    });

    await _amplitude.identify(identify);
  }
}
