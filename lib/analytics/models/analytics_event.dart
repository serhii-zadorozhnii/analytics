import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_event.freezed.dart';

part 'analytics_event.g.dart';

@Freezed(fromJson: false, toJson: true, unionValueCase: FreezedUnionCase.snake, copyWith: false)
abstract class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent.firstOpen({
    @JsonKey(includeToJson: false) @Default('first_open') String? title,
  }) = FirstOpen;

  const factory AnalyticsEvent.sessionStart({
    @JsonKey(includeToJson: false) @Default('session_start') String? title,
  }) = SessionStart;

  const factory AnalyticsEvent.onboardingFlow({
    @JsonKey(includeToJson: false) @Default('onboarding_flow') String? title,
  }) = OnboardingFlow;

  const factory AnalyticsEvent.welcomeScreenShown({
    @JsonKey(includeToJson: false) @Default('welcome_screen_shown') String? title,
    @JsonKey(name: 'screen_name') @Default('welcome_screen_name') String? screenName,
  }) = WelcomeScreenShown;

  const factory AnalyticsEvent.getStartedButtonTapped({
    @JsonKey(includeToJson: false) @Default('get_started_button_tapped') String? title,
  }) = GetStartedButtonTapped;

  const factory AnalyticsEvent.headsetPairingScreenShown({
    @JsonKey(includeToJson: false) @Default('headset_pairing_screen_shown') String? title,
  }) = HeadsetPairingScreenShown;

  const factory AnalyticsEvent.settingsButtonTapped({
    @JsonKey(includeToJson: false) @Default('settings_button_tapped') String? title,
  }) = SettingsButtonTapped;

  const factory AnalyticsEvent.connectLaterButtonTapped({
    @JsonKey(includeToJson: false) @Default('connect_later_button_tapped') String? title,
  }) = ConnectLaterButtonTapped;

  const factory AnalyticsEvent.onboardingScreenShown({
    @JsonKey(includeToJson: false) @Default('onboarding_screen_shown') String? title,
    @JsonKey(name: 'onboadring_name') required String onboardingName,
    @JsonKey(name: 'screen_number') required String screenNumber,
  }) = OnboardingScreenShown;

  const factory AnalyticsEvent.onboardingContinued({
    @JsonKey(includeToJson: false) @Default('onboarding_continued') String? title,
    @JsonKey(name: 'onboadring_name') required String onboardingName,
    @JsonKey(name: 'screen_number') required String screenNumber,
  }) = OnboardingContinued;

  const factory AnalyticsEvent.paywallShown({
    @JsonKey(includeToJson: false) @Default('paywall_shown') String? title,
    required String placement,
    required String type,
    @JsonKey(name: 'entry_point') required String entryPoint,
    @JsonKey(name: 'screen_name') required String screenName,
  }) = PaywallShown;

  const factory AnalyticsEvent.purchaseButtonTapped({
    @JsonKey(includeToJson: false) @Default('purchase_button_tapped') String? title,
    required String placement,
    required String type,
    @JsonKey(name: 'entry_point') required String entryPoint,
    @JsonKey(name: 'screen_name') required String screenName,
  }) = PurchaseButtonTapped;

  const factory AnalyticsEvent.restoreButtonTapped({
    @JsonKey(includeToJson: false) @Default('restore_button_tapped') String? title,
    required String placement,
  }) = RestoreButtonTapped;

  const factory AnalyticsEvent.paywallSkipped({
    @JsonKey(includeToJson: false) @Default('paywall_skipped') String? title,
    required String placement,
    required String type,
    @JsonKey(name: 'entry_point') required String entryPoint,
    @JsonKey(name: 'screen_name') required String screenName,
  }) = PaywallSkipped;

  const factory AnalyticsEvent.nativePermissionsPopUps({
    @JsonKey(includeToJson: false) @Default('native_permissions_pop_ups') String? title,
  }) = NativePermissionsPopUps;

  const factory AnalyticsEvent.attPermissionShown({
    @JsonKey(includeToJson: false) @Default('att_permission_shown') String? title,
  }) = AttPermissionShown;

  const factory AnalyticsEvent.attPermissionTapped({
    @JsonKey(includeToJson: false) @Default('att_permission_tapped') String? title,
    required String response,
  }) = AttPermissionTapped;

  const factory AnalyticsEvent.microphonePermissionShown({
    @JsonKey(includeToJson: false) @Default('microphone_permission_shown') String? title,
  }) = MicrophonePermissionShown;

  const factory AnalyticsEvent.microphonePermissionTapped({
    @JsonKey(includeToJson: false) @Default('microphone_permission_tapped') String? title,
    required String response,
  }) = MicrophonePermissionTapped;

  const factory AnalyticsEvent.speechRecognitionPermissionShown({
    @JsonKey(includeToJson: false) @Default('speech_recognition_permission_shown') String? title,
  }) = SpeechRecognitionPermissionShown;

  const factory AnalyticsEvent.speechRecognitionPermissionTapped({
    @JsonKey(includeToJson: false) @Default('speech_recognition_permission_tapped') String? title,
    required String response,
  }) = SpeechRecognitionPermissionTapped;

  const factory AnalyticsEvent.cameraPermissionShown({
    @JsonKey(includeToJson: false) @Default('camera_permission_shown') String? title,
  }) = CameraPermissionShown;

  const factory AnalyticsEvent.cameraPermissionTapped({
    @JsonKey(includeToJson: false) @Default('camera_permission_tapped') String? title,
    required String response,
  }) = CameraPermissionTapped;

  const factory AnalyticsEvent.mainScreen({
    @JsonKey(includeToJson: false) @Default('main_screen') String? title,
  }) = MainScreen;

  const factory AnalyticsEvent.mainScreenShown({
    @JsonKey(includeToJson: false) @Default('main_screen_shown') String? title,
  }) = MainScreenShown;

  const factory AnalyticsEvent.connectDeviceTapped({
    @JsonKey(includeToJson: false) @Default('connect_device_tapped') String? title,
    @JsonKey(name: 'entry_point') required String entryPoint,
  }) = ConnectDeviceTapped;

  const factory AnalyticsEvent.dontHaveTokiTapped({
    @JsonKey(includeToJson: false) @Default('dont_have_toki_tapped') String? title,
  }) = DontHaveTokiTapped;

  const factory AnalyticsEvent.modeTabSwitched({
    @JsonKey(includeToJson: false) @Default('mode_tab_switched') String? title,
    required String tab,
  }) = ModeTabSwitched;

  const factory AnalyticsEvent.dontHaveTokiShown({
    @JsonKey(includeToJson: false) @Default('dont_have_toki_shown') String? title,
  }) = DontHaveTokiShown;

  const factory AnalyticsEvent.dontHaveTokiExploreTapped({
    @JsonKey(includeToJson: false) @Default('dont_have_toki_explore_tapped') String? title,
  }) = DontHaveTokiExploreTapped;

  const factory AnalyticsEvent.tokiHeadphonesShown({
    @JsonKey(includeToJson: false) @Default('toki_headphones_shown') String? title,
  }) = TokiHeadphonesShown;

  const factory AnalyticsEvent.tokiHeadphonesLearnMoreTapped({
    @JsonKey(includeToJson: false) @Default('toki_headphones_learn_more_tapped') String? title,
    @JsonKey(name: 'toki_model') required String tokiModel,
  }) = TokiHeadphonesLearnMoreTapped;

  const factory AnalyticsEvent.conversationScreen({
    @JsonKey(includeToJson: false) @Default('conversation_screen') String? title,
  }) = ConversationScreen;

  const factory AnalyticsEvent.conversationScreenShown({
    @JsonKey(includeToJson: false) @Default('conversation_screen_shown') String? title,
    required String mode,
    @JsonKey(name: 'device_type') required String deviceType,
  }) = ConversationScreenShown;

  const factory AnalyticsEvent.modeInfoPopupShown({
    @JsonKey(includeToJson: false) @Default('mode_info_popup_shown') String? title,
    @JsonKey(name: 'screen_number') required String screenNumber,
    required String mode,
    @JsonKey(name: 'mode_type') required String modeType,
  }) = ModeInfoPopupShown;

  const factory AnalyticsEvent.modeInfoPopupContinue({
    @JsonKey(includeToJson: false) @Default('mode_info_popup_continue') String? title,
    required String mode,
    @JsonKey(name: 'mode_type') required String modeType,
  }) = ModeInfoPopupContinue;

  const factory AnalyticsEvent.viewModeChanged({
    @JsonKey(includeToJson: false) @Default('view_mode_changed') String? title,
    @JsonKey(name: 'view_mode') required String viewMode,
  }) = ViewModeChanged;

  const factory AnalyticsEvent.goModeWithoutHeadphones({
    @JsonKey(includeToJson: false) @Default('go_mode_without_headphones') String? title,
    required String mode,
    @JsonKey(name: 'mode_type') required String modeType,
  }) = GoModeWithoutHeadphones;

  const factory AnalyticsEvent.translatorScreen({
    @JsonKey(includeToJson: false) @Default('translator_screen') String? title,
  }) = TranslatorScreen;

  const factory AnalyticsEvent.translatorScreenShown({
    @JsonKey(includeToJson: false) @Default('translator_screen_shown') String? title,
  }) = TranslatorScreenShown;

  const factory AnalyticsEvent.changeTranslationModelTapped({
    @JsonKey(includeToJson: false) @Default('change_translation_model_tapped') String? title,
  }) = ChangeTranslationModelTapped;

  const factory AnalyticsEvent.pasteButtonTapped({
    @JsonKey(includeToJson: false) @Default('paste_button_tapped') String? title,
  }) = PasteButtonTapped;

  const factory AnalyticsEvent.translationModelChanged({
    @JsonKey(includeToJson: false) @Default('translation_model_changed') String? title,
    @JsonKey(name: 'ai_model') required String aiModel,
  }) = TranslationModelChanged;

  const factory AnalyticsEvent.translatorSettingsScreenShown({
    @JsonKey(includeToJson: false) @Default('translator_settings_screen_shown') String? title,
  }) = TranslatorSettingsScreenShown;

  const factory AnalyticsEvent.switchLanguageTapped({
    @JsonKey(includeToJson: false) @Default('switch_language_tapped') String? title,
    required String screen,
    @JsonKey(name: 'view_mode') String? viewMode,
    String? mode,
    @JsonKey(name: 'device_type') String? deviceType,
  }) = SwitchLanguageTapped;

  const factory AnalyticsEvent.inputLanguageChanged({
    @JsonKey(includeToJson: false) @Default('input_language_changed') String? title,
    required String screen,
    @JsonKey(name: 'input_language') required String inputLanguage,
    @JsonKey(name: 'input_language_mode') required String inputLanguageMode,
    @JsonKey(name: 'view_mode') String? viewMode,
    String? mode,
    @JsonKey(name: 'device_type') String? deviceType,
  }) = InputLanguageChanged;

  const factory AnalyticsEvent.outputLanguageChanged({
    @JsonKey(includeToJson: false) @Default('output_language_changed') String? title,
    required String screen,
    @JsonKey(name: 'output_language') required String outputLanguage,
    @JsonKey(name: 'input_language_mode') required String inputLanguageMode,
    @JsonKey(name: 'view_mode') String? viewMode,
    String? mode,
    @JsonKey(name: 'device_type') String? deviceType,
  }) = OutputLanguageChanged;

  const factory AnalyticsEvent.recordingStartTapped({
    @JsonKey(includeToJson: false) @Default('recording_start_tapped') String? title,
    required String screen,
    @JsonKey(name: 'active_microphone') String? activeMicrophone,
    @JsonKey(name: 'view_mode') String? viewMode,
    String? mode,
    @JsonKey(name: 'device_type') String? deviceType,
  }) = RecordingStartTapped;

  const factory AnalyticsEvent.recordingFailed({
    @JsonKey(includeToJson: false) @Default('recording_failed') String? title,
    required String stage,
    required String screen,
    @JsonKey(name: 'active_microphone') String? activeMicrophone,
    @JsonKey(name: 'view_mode') String? viewMode,
    String? mode,
    @JsonKey(name: 'device_type') String? deviceType,
  }) = RecordingFailed;

  const factory AnalyticsEvent.recordingStopTapped({
    @JsonKey(includeToJson: false) @Default('recording_stop_tapped') String? title,
    required String screen,
    @JsonKey(name: 'active_microphone') String? activeMicrophone,
    @JsonKey(name: 'view_mode') String? viewMode,
    String? mode,
    @JsonKey(name: 'device_type') String? deviceType,
    @JsonKey(name: 'time_ms') required String timeMs,
  }) = RecordingStopTapped;

  const factory AnalyticsEvent.translateButtonTapped({
    @JsonKey(includeToJson: false) @Default('translate_button_tapped') String? title,
    required String screen,
    @JsonKey(name: 'input_method') required String inputMethod,
    @JsonKey(name: 'ai_model') required String aiModel,
    @JsonKey(name: 'input_language') required String inputLanguage,
    @JsonKey(name: 'output_language') required String outputLanguage,
  }) = TranslateButtonTapped;

  const factory AnalyticsEvent.translationSuccessCompleted({
    @JsonKey(includeToJson: false) @Default('translation_success_completed') String? title,
    required String screen,
    @JsonKey(name: 'input_method') required String inputMethod,
    @JsonKey(name: 'ai_model') required String aiModel,
    @JsonKey(name: 'input_language') required String inputLanguage,
    @JsonKey(name: 'output_language') required String outputLanguage,
    @JsonKey(name: 'translation_time_ms') required String translationTimeMs,
  }) = TranslationSuccessCompleted;

  const factory AnalyticsEvent.translationFailed({
    @JsonKey(includeToJson: false) @Default('translation_failed') String? title,
    required String screen,
    @JsonKey(name: 'input_method') required String inputMethod,
    @JsonKey(name: 'ai_model') required String aiModel,
    @JsonKey(name: 'input_language') required String inputLanguage,
    @JsonKey(name: 'output_language') required String outputLanguage,
    @JsonKey(name: 'error_code') required String errorCode,
  }) = TranslationFailed;

  const factory AnalyticsEvent.translationOptionTapped({
    @JsonKey(includeToJson: false) @Default('translation_option_tapped') String? title,
    required String screen,
    required String button,
  }) = TranslationOptionTapped;

  const factory AnalyticsEvent.newTranslationButtonTapped({
    @JsonKey(includeToJson: false) @Default('new_translation_button_tapped') String? title,
  }) = NewTranslationButtonTapped;

  const factory AnalyticsEvent.offlineTranslateToggleSwitched({
    @JsonKey(includeToJson: false) @Default('offline_translate_toggle_switched') String? title,
    @JsonKey(name: 'toggle_value') required String toggleValue,
  }) = OfflineTranslateToggleSwitched;

  const factory AnalyticsEvent.historyTranslationTapped({
    @JsonKey(includeToJson: false) @Default('history_translation_tapped') String? title,
  }) = HistoryTranslationTapped;

  const factory AnalyticsEvent.translationHistoryScreen({
    @JsonKey(includeToJson: false) @Default('translation_history_screen') String? title,
  }) = TranslationHistoryScreen;

  const factory AnalyticsEvent.translationHistoryScreenShown({
    @JsonKey(includeToJson: false) @Default('translation_history_screen_shown') String? title,
    @JsonKey(name: 'entry_point') required String entryPoint,
  }) = TranslationHistoryScreenShown;

  const factory AnalyticsEvent.translationHistorySearchTapped({
    @JsonKey(includeToJson: false) @Default('translation_history_search_tapped') String? title,
  }) = TranslationHistorySearchTapped;

  const factory AnalyticsEvent.translationHistorySearchResulted({
    @JsonKey(includeToJson: false) @Default('translation_history_search_resulted') String? title,
  }) = TranslationHistorySearchResulted;

  const factory AnalyticsEvent.moreButtonTapped({
    @JsonKey(includeToJson: false) @Default('more_button_tapped') String? title,
  }) = MoreButtonTapped;

  const factory AnalyticsEvent.historyItemDeleted({
    @JsonKey(includeToJson: false) @Default('history_item_deleted') String? title,
  }) = HistoryItemDeleted;

  const factory AnalyticsEvent.historyItemShared({
    @JsonKey(includeToJson: false) @Default('history_item_shared') String? title,
  }) = HistoryItemShared;

  const factory AnalyticsEvent.historyItemCopied({
    @JsonKey(includeToJson: false) @Default('history_item_copied') String? title,
  }) = HistoryItemCopied;

  const factory AnalyticsEvent.cameraScreen({
    @JsonKey(includeToJson: false) @Default('camera_screen') String? title,
  }) = CameraScreen;

  const factory AnalyticsEvent.cameraScreenShown({
    @JsonKey(includeToJson: false) @Default('camera_screen_shown') String? title,
  }) = CameraScreenShown;

  const factory AnalyticsEvent.mediaImported({
    @JsonKey(includeToJson: false) @Default('media_imported') String? title,
    @JsonKey(name: 'size_mb') required String sizeMb,
    @JsonKey(name: 'time_ms') required String timeMs,
  }) = MediaImported;

  const factory AnalyticsEvent.photoTaken({
    @JsonKey(includeToJson: false) @Default('photo_taken') String? title,
    @JsonKey(name: 'size_mb') required String sizeMb,
  }) = PhotoTaken;

  const factory AnalyticsEvent.continueTranslationTapped({
    @JsonKey(includeToJson: false) @Default('continue_translation_tapped') String? title,
  }) = ContinueTranslationTapped;

  const factory AnalyticsEvent.flashModeChanged({
    @JsonKey(includeToJson: false) @Default('flash_mode_changed') String? title,
    @JsonKey(name: 'flash_mode') required String flashMode,
  }) = FlashModeChanged;

  const factory AnalyticsEvent.conversationTranslatorSettingsScreen({
    @JsonKey(includeToJson: false)
    @Default('conversation_translator_settings_screen')
    String? title,
  }) = ConversationTranslatorSettingsScreen;

  const factory AnalyticsEvent.conversationSettingsScreenShown({
    @JsonKey(includeToJson: false) @Default('conversation_settings_screen_shown') String? title,
  }) = ConversationSettingsScreenShown;

  const factory AnalyticsEvent.translationModelTapped({
    @JsonKey(includeToJson: false) @Default('translation_model_tapped') String? title,
  }) = TranslationModelTapped;

  const factory AnalyticsEvent.translationModelSelected({
    @JsonKey(includeToJson: false) @Default('translation_model_selected') String? title,
    @JsonKey(name: 'ai_model') required String aiModel,
  }) = TranslationModelSelected;

  const factory AnalyticsEvent.autoSpeechToggleSwitched({
    @JsonKey(includeToJson: false) @Default('auto_speech_toggle_switched') String? title,
    @JsonKey(name: 'toggle_value') required String toggleValue,
  }) = AutoSpeechToggleSwitched;

  const factory AnalyticsEvent.voiceTypeTapped({
    @JsonKey(includeToJson: false) @Default('voice_type_tapped') String? title,
    required String screen,
  }) = VoiceTypeTapped;

  const factory AnalyticsEvent.voiceTypeChanged({
    @JsonKey(includeToJson: false) @Default('voice_type_changed') String? title,
    required String screen,
    @JsonKey(name: 'voice_type') required String voiceType,
  }) = VoiceTypeChanged;

  const factory AnalyticsEvent.fontSizeTapped({
    @JsonKey(includeToJson: false) @Default('font_size_tapped') String? title,
    required String screen,
  }) = FontSizeTapped;

  const factory AnalyticsEvent.fontSizeChanged({
    @JsonKey(includeToJson: false) @Default('font_size_changed') String? title,
    required String screen,
    required String size,
  }) = FontSizeChanged;

  const factory AnalyticsEvent.voiceRateChanged({
    @JsonKey(includeToJson: false) @Default('voice_rate_changed') String? title,
    required String screen,
    required String rate,
  }) = VoiceRateChanged;

  const factory AnalyticsEvent.offlineModeToggleSwitched({
    @JsonKey(includeToJson: false) @Default('offline_mode_toggle_switched') String? title,
    required String screen,
    @JsonKey(name: 'toggle_value') required String toggleValue,
  }) = OfflineModeToggleSwitched;

  const factory AnalyticsEvent.downloadNowTapped({
    @JsonKey(includeToJson: false) @Default('download_now_tapped') String? title,
    required String screen,
    required String language,
  }) = DownloadNowTapped;

  const factory AnalyticsEvent.deleteDialogTapped({
    @JsonKey(includeToJson: false) @Default('delete_dialog_tapped') String? title,
  }) = DeleteDialogTapped;

  const factory AnalyticsEvent.deleteConfirmationTapped({
    @JsonKey(includeToJson: false) @Default('delete_confirmation_tapped') String? title,
  }) = DeleteConfirmationTapped;

  const factory AnalyticsEvent.dialogDeleted({
    @JsonKey(includeToJson: false) @Default('dialog_deleted') String? title,
  }) = DialogDeleted;

  const factory AnalyticsEvent.menuScreen({
    @JsonKey(includeToJson: false) @Default('menu_screen') String? title,
  }) = MenuScreen;

  const factory AnalyticsEvent.menuScreenShown({
    @JsonKey(includeToJson: false) @Default('menu_screen_shown') String? title,
    @JsonKey(name: 'entry_point') required String entryPoint,
  }) = MenuScreenShown;

  const factory AnalyticsEvent.settingsActionTapped({
    @JsonKey(includeToJson: false) @Default('settings_action_tapped') String? title,
    required String action,
  }) = SettingsActionTapped;

  const factory AnalyticsEvent.helpItemTapped({
    @JsonKey(includeToJson: false) @Default('help_item_tapped') String? title,
    @JsonKey(name: 'category_title') required String categoryTitle,
  }) = HelpItemTapped;

  const factory AnalyticsEvent.feedbackSent({
    @JsonKey(includeToJson: false) @Default('feedback_sent') String? title,
    required String text,
  }) = FeedbackSent;

  const factory AnalyticsEvent.appShared({
    @JsonKey(includeToJson: false) @Default('app_shared') String? title,
  }) = AppShared;

  const factory AnalyticsEvent.adsScreen({
    @JsonKey(includeToJson: false) @Default('ads_screen') String? title,
  }) = AdsScreen;

  const factory AnalyticsEvent.adShown({
    @JsonKey(includeToJson: false) @Default('ad_shown') String? title,
    @JsonKey(name: 'ad_type') required String adType,
    required String placement,
    @JsonKey(name: 'admob_id') required String admobId,
  }) = AdShown;

  const factory AnalyticsEvent.adButtonTapped({
    @JsonKey(includeToJson: false) @Default('ad_button_tapped') String? title,
    @JsonKey(name: 'ad_type') required String adType,
    required String placement,
    @JsonKey(name: 'admob_id') required String admobId,
  }) = AdButtonTapped;
}

extension AnalyticsEventExtention on AnalyticsEvent {
  String get eventTitle => title!;
}
