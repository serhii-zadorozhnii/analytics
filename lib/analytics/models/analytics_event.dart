import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'analytics_event.freezed.dart';

part 'analytics_event.g.dart';

@Freezed(
  fromJson: true,
  toJson: true,
  unionValueCase: FreezedUnionCase.snake,
  equal: false,
  copyWith: false,
)
abstract class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent.onboardStepOpened({
    @Default('onboardstep_opened') String title,
    @JsonKey(name: 'step_number') required int stepNumber,
  }) = OnboardStepOpened;

  const factory AnalyticsEvent.onboardPaywallOpened({
    @Default('onboard_paywall_opened') String title,
    @JsonKey(name: 'screen_type') required String screenType,
  }) = OnboardPaywallOpened;

  const factory AnalyticsEvent.onboardPaywallPlanSelected({
    @Default('onboard_paywall_plan_selected') String title,
    @JsonKey(name: 'plan_type') required String planType,
  }) = OnboardPaywallPlanSelected;

  const factory AnalyticsEvent.onboardPaywallContinue({
    @Default('onboard_paywall_continue') String title,
    @JsonKey(name: 'plan_type') required String planType,
    @JsonKey(name: 'screen_type') required String screenType,
  }) = OnboardPaywallContinue;

  const factory AnalyticsEvent.onboardRestoreTapped({
    @Default('onboard_restore_tapped') String title,
    @JsonKey(name: 'screen_type') required String screenType,
  }) = OnboardRestoreTapped;

  const factory AnalyticsEvent.onboardTermsTapped({
    @Default('onboard_terms_tapped') String title,
    @JsonKey(name: 'screen_type') required String screenType,
  }) = OnboardTermsTapped;

  const factory AnalyticsEvent.onboardPrivacyTapped({
    @Default('onboard_privacy_tapped') String title,
    @JsonKey(name: 'screen_type') required String screenType,
  }) = OnboardPrivacyTapped;

  const factory AnalyticsEvent.faqQuestionOpened({
    @JsonKey(name: 'title', defaultValue: 'faq_question_opened', includeToJson: false) String title,
    @JsonKey(name: 'question') required String question,
  }) = FaqQuestionOpened;

  const factory AnalyticsEvent.mainOpened({@Default('main_opened') String title}) = MainOpened;

  const factory AnalyticsEvent.permissionResult({
    @Default('permission_result') String title,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'granted') required bool granted,
  }) = PermissionResult;
}
