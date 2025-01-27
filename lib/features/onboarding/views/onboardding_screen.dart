import 'package:flutter/material.dart';
import 'package:pure_minds/config/app_consts.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';
import 'package:pure_minds/features/general_widgets/main_button.dart';
import 'package:pure_minds/features/general_widgets/main_safe_area.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';
import 'package:pure_minds/features/main_layout/main_layout.dart';
import 'package:pure_minds/features/onboarding/views/widgets/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboarddingScreen extends StatefulWidget {
  const OnboarddingScreen({super.key});

  @override
  State<OnboarddingScreen> createState() => _OnboarddingScreenState();
}

class _OnboarddingScreenState extends State<OnboarddingScreen> {
  final controller = PageController();
  final currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return MainSafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpacing(50),
          SizedBox(
            height: 360,
            width: MediaQuery.sizeOf(context).width,
            child: PageView.builder(
              controller: controller,
              itemCount: DummyData.onBoardings.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                currentIndex.value = value;
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: AppConsts.defaultHorPadding,
                  child: Image.asset(
                    DummyData.onBoardings[index].image,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          const VerticalSpacing(10),
          Expanded(
            child: Padding(
              padding: AppConsts.defaultPadding,
              child: ValueListenableBuilder(
                  valueListenable: currentIndex,
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Expanded(
                          child: OnBoardingContent(
                            index: value,
                            item: DummyData.onBoardings[value],
                          ),
                        ),
                        VerticalSpacing(24),
                        SmoothPageIndicator(
                          controller: controller,
                          count: DummyData.onBoardings.length,
                          effect: CustomizableEffect(
                            dotDecoration: DotDecoration(
                              height: 6,
                              width: 23,
                              color: Co.lightGrey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            activeDotDecoration: DotDecoration(
                              height: 6,
                              width: 23,
                              color: Co.green,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        VerticalSpacing(40),
                        ValueListenableBuilder(
                            valueListenable: currentIndex,
                            builder: (context, value, child) {
                              return AnimatedSwitcher(
                                  duration: Durations.medium3,
                                  transitionBuilder: (child, animation) =>
                                      FadeTransition(opacity: animation, child: child),
                                  child: value < 2
                                      ? MainButton(
                                          text: L10n.tr().next,
                                          ontap: () {
                                            if (value < DummyData.onBoardings.length - 1) {
                                              controller.nextPage(
                                                  duration: Durations.medium4,
                                                  curve: Curves.easeInOut);
                                            } else {
                                              context.myPushReplacment(const MainLayout());
                                            }
                                          },
                                        )
                                      : child!);
                            },
                            child: Column(
                              spacing: 16,
                              children: [
                                MainButton(
                                  text: L10n.tr().createAnAccount.toUpperCase(),
                                  bgColor: Co.black,
                                  style: TStyle.whiteBold(15),
                                  ontap: () {},
                                ),
                                MainButton(
                                  text: L10n.tr().login.toUpperCase(),
                                  bgColor: Co.white,
                                  style: TStyle.blackBold(15),
                                  showBorder: true,
                                  borderColor: Co.black,
                                  ontap: () {},
                                )
                              ],
                            )),
                        VerticalSpacing(10),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
