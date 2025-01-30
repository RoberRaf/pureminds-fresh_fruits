import 'package:flutter/material.dart';

abstract class AppConsts {
  static BorderRadius defaultRadius = BorderRadius.circular(30);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> categoryNavigatorKey = GlobalKey<NavigatorState>();

  static List<BoxShadow> boxSahdow({int? alpha, Color? color}) => [
        BoxShadow(
          color: (color ?? Colors.black).withAlpha(alpha ?? 25),
          blurRadius: 10,
          spreadRadius: 5,
          offset: const Offset(0, 0),
        )
      ];

  static get defaultPadding => const EdgeInsets.symmetric(horizontal: 22, vertical: 16);
  static get defaultHorPadding => const EdgeInsets.symmetric(horizontal: 28);
}
