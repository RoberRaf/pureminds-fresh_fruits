import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pure_minds/config/app_consts.dart';

class L10n {
  static final List<Locale> supportedLocales = [
    const Locale("en", ""),
    const Locale("ar", ""),
  ];
  /*
*********** VERY IMPORTANT ***********
Localizing for iOS: Updating the iOS app bundle:

    Typically, iOS applications define key application metadata, including supported locales, in an Info.plist file that is built into the application bundle. To configure the locales supported by your app, use the following instructions:

    Open your project’s ios/Runner.xcworkspace Xcode file.

    In the Project Navigator, open the Info.plist file under the Runner project’s Runner folder.

    Select the Information Property List item. Then select Add Item from the Editor menu, and select Localizations from the pop-up menu.

    Select and expand the newly-created Localizations item. For each locale your application supports, add a new item and select the locale you wish to add from the pop-up menu in the Value field. This list should be consistent with the languages listed in the supportedLocales parameter.

    Once all supported locales have been added, save the file.
  */

  static const List<LocalizationsDelegate> localizationDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static Locale? setFallbackLocale(deviceLocale, _) {
    final List<String> supportedLangCodes =
        supportedLocales.map((e) => e.languageCode).toList();
    final String deviceLangCode = deviceLocale.toString().substring(0, 2);
    if (!supportedLangCodes.contains(deviceLangCode)) {
      return supportedLocales[0];
    }
    return null;
  }

  static AppLocalizations tr() =>
      AppLocalizations.of(AppConsts.navigatorKey.currentContext!)!;

  static bool isAr(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'ar';
}
