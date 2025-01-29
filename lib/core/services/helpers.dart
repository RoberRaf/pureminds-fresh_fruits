import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class Helpers {
  static Future customTryCatch(Future Function() func) async {
    try {
      await func();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static String getProperPrice(num price) {
    final isInt = price % 1 == 0;
    return ('\$ ') + (isInt ? price.toStringAsFixed(0) : price.toStringAsFixed(2));
  }

 static Route platformPageRoute(Widget screen, RouteSettings settings) {
    return Platform.isAndroid
        ? MaterialPageRoute(builder: (_) => screen, settings: settings)
        : CupertinoPageRoute(builder: (_) => screen, settings: settings);
  }
}
