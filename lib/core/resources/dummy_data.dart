import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/features/onboarding/data/onboarding_model.dart';

class DummyData {
  static final onBoardings = [
    OnboardingModel(image: Assets.assetsPngOnboarding1, title: L10n.tr().onboadring1, description: L10n.tr().lorumIpsum),
    OnboardingModel(image: Assets.assetsPngOnboarding1, title: L10n.tr().onboadring2, description: L10n.tr().lorumIpsum),
    OnboardingModel(image: Assets.assetsPngOnboarding2, title: L10n.tr().onboadring3, description: L10n.tr().lorumIpsum),
  ];
}