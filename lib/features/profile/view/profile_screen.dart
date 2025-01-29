import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/app_consts.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/features/general_widgets/main_safe_area.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';
import 'package:pure_minds/features/splash/splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final toMove = ValueNotifier(false);
    Future.delayed(Durations.short1, () => toMove.value = true);
    return MainSafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(L10n.tr().welcomeToFresFruits)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Co.white,
                  borderRadius: AppConsts.defaultRadius,
                  boxShadow: AppConsts.boxSahdow()),
              child: Padding(
                padding: AppConsts.defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HorizontalSpacing(double.infinity),
                    const VerticalSpacing(40),
                    ValueListenableBuilder(
                      valueListenable: toMove,
                      builder: (context, value, child) => AnimatedOpacity(
                        duration: Durations.long1,
                        opacity: value ? 1 : 0,
                        child: AnimatedSlide(
                          duration: Durations.long2,
                          offset: Offset(0, value ? 0 : -0.5),
                          child: child!,
                        ),
                      ),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Co.darkGrey,
                              spreadRadius: 8,
                              // blurRadius: 16.r,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Co.yellow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(Assets.assetsSvgLogo),
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacing(32),
                    ValueListenableBuilder(
                      valueListenable: toMove,
                      builder: (context, value, child) => AnimatedOpacity(
                        duration: Durations.long1,
                        opacity: toMove.value ? 1 : 0,
                        child: AnimatedSlide(
                          duration: Durations.long2,
                          offset: Offset(toMove.value ? 0 : (L10n.isAr(context) ? -0.2 : 0.2), 0),
                          child: child!,
                        ),
                      ),
                      child: Text(
                        L10n.tr().lorumIpsum + ' ' + L10n.tr().lorumIpsum,
                        style: TStyle.blackSemi(15),
                      ),
                    ),
                    const VerticalSpacing(16),
                  ],
                ),
              ),
            ),
            const VerticalSpacing(32),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Co.white,
                  borderRadius: AppConsts.defaultRadius,
                  boxShadow: AppConsts.boxSahdow()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  children: [
                    Text(L10n.tr().changeLanguage, style: TStyle.blackSemi(15)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.myPush(const SplashScreen(isABreaker: true));
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.language, color: Co.black),
                          const HorizontalSpacing(15),
                          Text(
                            L10n.isAr(context) ? L10n.tr().english : L10n.tr().arabic,
                            style: TStyle.blackSemi(15),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
