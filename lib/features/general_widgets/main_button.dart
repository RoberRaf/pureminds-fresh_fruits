import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.text,
      required this.ontap,
      this.style,
      this.borderRadius,
      this.bgColor = Co.yellow,
      this.borderColor,
      this.showBorder = false,
      this.isLoading = false,
      this.enable = true,
      this.padding,
      this.margin = EdgeInsets.zero,
      this.height,
      this.width,
      this.child,
      this.icon
      // this.dontGiveMinWidth,
      });
  final String text;
  final Function() ontap;
  final TextStyle? style;
  final double? borderRadius;
  final Color bgColor;
  final Color? borderColor;
  final bool showBorder;
  final bool isLoading;
  final bool enable;
  final EdgeInsets? padding;
  final EdgeInsets margin;
  final double? height;
  final double? width;
  final Widget? child;
  final dynamic icon;
  // final bool? dontGiveMinWidth;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Platform.isAndroid
                ? CircularProgressIndicator(
                    color: bgColor,
                  )
                : CupertinoActivityIndicator(
                    color: bgColor,
                  ),
          )
        : Padding(
            padding: margin,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  color: !enable ? Co.grey : bgColor,
                  // gradient: !enable
                  //     ? null
                  //     : hasGradient
                  //         ? LinearGradient(
                  //             colors: gradientColors ?? (isGradientPrimaryColor ? AppConsts.primaryColorGridiant : AppConsts.secondryColorGridiant),
                  //             stops: AppConsts.buttonGridantStops,
                  //           )
                  //         : null,
                ),
                // height: height ?? 50.h,
                child: MaterialButton(
                  minWidth: padding != null ? null : width ?? double.infinity,
                  onPressed: enable ? ontap : null,
                  padding: padding ??
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    side: showBorder
                        ? BorderSide(color: borderColor ?? Co.orange)
                        : BorderSide.none,
                    borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  ),
                  child: child ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null && icon is IconData)
                            Icon(
                              icon,
                              color: style?.color ?? Co.white,
                              size: 22,
                            ),
                          if (icon != null && icon is String)
                            SvgPicture.asset(
                              icon,
                              width: 22,
                              height: 22,
                              colorFilter: const ColorFilter.mode(
                                  Co.white, BlendMode.srcIn),
                            ),
                          const HorizontalSpacing(12),
                          Text(text,
                              style: style ?? TStyle.blackBold(16),
                              overflow: TextOverflow.ellipsis),
                          const HorizontalSpacing(12),
                        ],
                      ),
                )),
          );
  }
}
