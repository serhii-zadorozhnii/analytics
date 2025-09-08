import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_event.freezed.dart';

part 'analytics_event.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
  unionValueCase: FreezedUnionCase.snake,
  equal: false,
  copyWith: false,
)
abstract class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent.onboardStepOpened({
    @JsonKey(includeToJson: false) @Default('onboardstep_opened') String? title,
    @JsonKey(name: 'step_number') required int stepNumber,
  }) = OnboardStepOpened;

  const factory AnalyticsEvent.onboardPaywallOpened({
    @JsonKey(includeToJson: false) @Default('onboard_paywall_opened') String? title,
    @JsonKey(name: 'screen_type') required String screenType,
  }) = OnboardPaywallOpened;

  const factory AnalyticsEvent.onboardPaywallContinue({
    @JsonKey(includeToJson: false) @Default('onboard_paywall_continue') String? title,
    @JsonKey(name: 'plan_type') required String planType,
    @JsonKey(name: 'screen_type') required String screenType,
  }) = OnboardPaywallContinue;
}

extension AnalyticsEventExtention on AnalyticsEvent {
  String get eventTitle => title!;
}
