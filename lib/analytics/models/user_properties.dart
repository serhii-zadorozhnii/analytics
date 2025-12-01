import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_properties.freezed.dart';

part 'user_properties.g.dart';

@freezed
abstract class UserProperties with _$UserProperties {
  const factory UserProperties({
    @JsonKey(name: 'cohort_day') required int cohortDay,
    @JsonKey(name: 'cohort_week') required int cohortWeek,
    @JsonKey(name: 'cohort_month') required int cohortMonth,
    @JsonKey(name: 'cohort_year') required int cohortYear,

    @JsonKey(name: 'user_type') required UserType userType,
    @JsonKey(name: 'active_subscription') String? activeSubscriptionId,

    @JsonKey(name: 'att_permission_status') required PermissionStatus attPermissionStatus,
    @JsonKey(name: 'camera_permission_status') required PermissionStatus cameraPermissionStatus,
    @JsonKey(name: 'microphone_permission_status')
    required PermissionStatus microphonePermissionStatus,
    @JsonKey(name: 'speech_recognition_permission_status')
    required PermissionStatus speechRecognitionPermissionStatus,

    @JsonKey(name: 'mode') required AppThemeMode mode,
    @JsonKey(name: 'pro_quality') required ProQualityMode proQuality,

    @JsonKey(name: 'conversation_messages_sent') required int conversationMessagesSent,
    @JsonKey(name: 'total_voice_translations') required int totalVoiceTranslations,
    @JsonKey(name: 'total_text_translations') required int totalTextTranslations,
  }) = _UserProperties;

  factory UserProperties.fromJson(Map<String, dynamic> json) => _$UserPropertiesFromJson(json);
}

// Enums
enum UserType { free, trial, premium }

enum PermissionStatus { allowed, denied }

enum AppThemeMode { light, dark }

enum ProQualityMode { on, off }

extension UserTypeX on UserType {
  String get value => name;
}

extension PermissionStatusX on PermissionStatus {
  String get value => name;
}

extension AppThemeModeX on AppThemeMode {
  String get value => name;
}

extension ProQualityModeX on ProQualityMode {
  String get value => name;
}
