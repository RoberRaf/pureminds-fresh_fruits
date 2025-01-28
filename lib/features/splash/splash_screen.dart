import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';
import 'package:pure_minds/features/onboarding/views/onboardding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) context.myPushReplacment(const OnboarddingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Co.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.assetsSvgLogo,
            height: 197,
            width: 130,
            fit: BoxFit.cover,
          ),
          const VerticalSpacing(38),
          Text(
            'Fresh Fruits',
            style: TStyle.whiteBold(38),
          ),
          const HorizontalSpacing(double.infinity),
          const VerticalSpacing(127),
        ],
      ),
    );
  }
}
