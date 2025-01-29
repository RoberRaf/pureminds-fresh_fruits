import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/core/cubits/settings_cubit/settings_cubit.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';
import 'package:pure_minds/features/onboarding/views/onboardding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.isABreaker = false});
  final bool isABreaker;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if (widget.isABreaker) {
      context.read<SettingsCubit>().switchAppLocale(L10n.tr().locale);
      Future.delayed(Durations.long2, () => context.myPop());
    } else {
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) context.myPushReplacment(const OnboarddingScreen());
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
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
      ),
    );
  }
}
