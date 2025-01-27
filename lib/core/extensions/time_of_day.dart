import 'package:flutter/material.dart';

extension MemberTimeOfDay on TimeOfDay? {
  String get toStringFormat {
    var time = this;
    return '${_twoDigits(time?.hour ?? 00)}:${_twoDigits(time?.minute ?? 00)}:00';
  }

  static String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}
