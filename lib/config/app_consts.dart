import 'package:flutter/material.dart';

abstract class AppConsts {
  static const fileSizeInBytes = 2097152;
  static const trackingInterval = 30;

  // static const double defaultBorderRadius = 10;
  static BorderRadius defaultRadius = BorderRadius.circular(30);

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static List<BoxShadow> boxSahdow({int? alpha, Color? color}) => [
        BoxShadow(
          color: (color ?? Colors.black).withAlpha(alpha ?? 25),
          blurRadius: 10,
          spreadRadius: 5,
          offset: const Offset(0, 0),
        )
      ];

  static final defaultPadding =
      const EdgeInsets.symmetric(horizontal: 28, vertical: 28);
  static final defaultHomePadding = const EdgeInsets.fromLTRB(28, 168, 28, 135);
  static final defaultHorPadding = const EdgeInsets.symmetric(horizontal: 28);
}
