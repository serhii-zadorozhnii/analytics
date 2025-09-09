import 'package:analytics/analytics/models/analytics_event.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum _AviriseLogConstant {
  appID('app-id'),
  logEventEndpoint('logevent'),
  logAdEndpoint('logad'),
  host('http://domain');

  const _AviriseLogConstant(this.value);

  final String value;
}

class AviriseLogService {
  AviriseLogService();

  Future<void> sendLog(AnalyticsEvent event) async {
    final dio = Dio(BaseOptions(baseUrl: _AviriseLogConstant.host.value));
    try {
      final dateString = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

      final body = {
        'userId': 'dev',
        'event': '${event.title}, params: ${event.toJson()}',
        'date': dateString,
        'appId': _AviriseLogConstant.appID.value,
      };

      final url = '/${_AviriseLogConstant.logEventEndpoint.value}';

      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (s) => s! < 500,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          debugPrint('[API Success] Event logged successfully: ${event.title}');
        }
      } else {
        debugPrint('[API Error] Server returned ${response.statusCode}: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('[API Error] Dio error with response:');
        debugPrint('  Status: ${e.response?.statusCode}');
        debugPrint('  Data: ${e.response?.data}');
        debugPrint('  Headers: ${e.response?.headers}');
      } else {
        debugPrint('[API Error] Dio error without response:');
        debugPrint('  Error type: ${e.type}');
        debugPrint('  Message: ${e.message}');
      }
    } catch (e) {
      debugPrint('[API Error] Unexpected error: $e');
    }
  }
}
