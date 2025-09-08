import 'package:analytics/analytics/service_imp/amplitude_event_service.dart';
import 'package:analytics/analytics/models/analytics_event.dart';
import 'package:analytics/analytics/event_service.dart';
import 'package:analytics/analytics/service_imp/firebase_event_service.dart';
import 'package:flutter/material.dart';

void main() async {
  await EventService().init(
    services: [
      FirebaseEventService(),
      AmplitudeEventService(apiKey: 'YOUR-API-KEY'),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              EventService().logEvent(AnalyticsEvent.onboardStepOpened(stepNumber: 1));
            },
            child: Text('Send event'),
          ),
        ),
      ),
    );
  }
}
