import 'package:flutter/material.dart';
import 'package:pure_minds/config/theming/app_colors.dart';

class MainSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;
  const MainSafeArea({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color ?? Co.greyishWhite,
      child: SafeArea(child: child),
    );
  }
}
