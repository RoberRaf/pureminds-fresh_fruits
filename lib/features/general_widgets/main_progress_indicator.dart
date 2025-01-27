import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pure_minds/config/theming/app_colors.dart';

class MainProgressIndicator extends StatelessWidget {
  const MainProgressIndicator({super.key, this.topPadding});
  final double? topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 20),
      child: Center(
        child: Platform.isAndroid
            ? const CircularProgressIndicator(
                color: Co.orange,
              )
            : CupertinoActivityIndicator(
                color: Co.orange,
                radius: 24,
              ),
      ),
    );
  }
}
