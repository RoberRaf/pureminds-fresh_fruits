import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/features/onboarding/data/onboarding_model.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key, required this.item, required this.index});
  final OnboardingModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AnimatedSwitcher(
        duration: Durations.medium3,
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: Column(
          key: ValueKey(index),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                if (index == 0)
                  Text(
                    L10n.tr().welcomeToFresFruits,
                    style: TStyle.blackBold(26),
                  ),
                Text(
                  item.title,
                  style: TStyle.blackBold(26),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
            Text(
              item.description,
              style: TStyle.greySemi(16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
