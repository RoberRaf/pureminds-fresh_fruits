

import 'package:flutter/foundation.dart';

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
    return (isInt ? price.toStringAsFixed(0) : price.toStringAsFixed(2)) +
        (' EG');
  }
}
