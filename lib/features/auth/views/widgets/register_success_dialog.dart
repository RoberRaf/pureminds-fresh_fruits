import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/features/auth/views/login_screen.dart';
import 'package:pure_minds/features/general_widgets/main_button.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class RegisterSuccessDialog extends StatefulWidget {
  const RegisterSuccessDialog({super.key, required this.name});
  final String name;

  @override
  State<RegisterSuccessDialog> createState() => _RegisterSuccessDialogState();
}

class _RegisterSuccessDialogState extends State<RegisterSuccessDialog> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 5));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Durations.medium2, () => _controllerCenter.play());
    });
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);
    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step), halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 38),
          shape: RoundedRectangleBorder(
            borderRadius: AppConsts.defaultRadius,
          ),
          backgroundColor: Co.greyishWhite,
          child: Padding(
            padding: AppConsts.defaultPadding,
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalSpacing(10),
                Text(
                  L10n.tr().congradulations,
                  style: TStyle.orangeBold(26),
                ),
                Text(
                  widget.name,
                  style: TStyle.purpleSemi(16),
                ),
                ConfettiWidget(
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: true,
                  maxBlastForce: 10,
                  minBlastForce: 5,
                  numberOfParticles: 40,
                  emissionFrequency: 0.03,
                  gravity: 0.01,
                  minimumSize: const Size(10, 10),
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ],
                  createParticlePath: drawStar,
                ),
                const VerticalSpacing(50),
                MainButton(
                    margin: AppConsts.defaultPadding,
                    text: L10n.tr().signIn.toUpperCase(),
                    ontap: () {
                      context.myPop();
                      context.myPushReplacment(const LoginScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
