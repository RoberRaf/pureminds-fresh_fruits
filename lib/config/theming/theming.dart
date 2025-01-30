import 'package:flutter/material.dart';
import 'package:pure_minds/config/app_consts.dart';
import 'package:pure_minds/config/theming/app_colors.dart';

export 'package:pure_minds/config/app_consts.dart';
export 'package:pure_minds/config/theming/app_colors.dart';
export 'package:pure_minds/config/theming/text_styles.dart';

enum ThemeCo {
  primary,
  grey,
  reverse,
}

class MyTheme {
  static ThemeData get mainTheme => ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        fontFamily: 'poppins',
        scaffoldBackgroundColor: Co.greyishWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: Co.white,
          shadowColor: Colors.black12,
          elevation: 20,
          surfaceTintColor: Colors.transparent,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   systemNavigationBarColor: Colors.purple, // Navigation bar
          //   statusBarColor: Colors.purple, // Status bar
          // ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: AppConsts.defaultRadius),
        ),
        cardColor: Colors.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        highlightColor: Colors.black12,
        disabledColor: Co.grey,
        canvasColor: Colors.white,
        shadowColor: Colors.black12,
        listTileTheme: ListTileThemeData(
          selectedColor: Colors.white,
          dense: true,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: AppConsts.defaultRadius,
            side: BorderSide(color: Colors.grey.withAlpha(50), width: 1),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            menuStyle: MenuStyle(
                shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                backgroundColor: const WidgetStatePropertyAll(Co.white))),
        dialogTheme: DialogTheme(
            insetPadding: const EdgeInsets.symmetric(horizontal: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        radioTheme: const RadioThemeData(fillColor: WidgetStatePropertyAll(Co.orange)),
      );
  static ThemeData get darkTheme => mainTheme.copyWith(
      scaffoldBackgroundColor: MyTh.dark300,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: MyTh.dark200),
      highlightColor: Colors.white,
      disabledColor: Co.lightGrey,
      canvasColor: Co.black,
      shadowColor: Colors.white12);
}
