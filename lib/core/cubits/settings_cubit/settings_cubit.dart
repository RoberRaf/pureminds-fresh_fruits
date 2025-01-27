import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/cubits/settings_cubit/settings_states.dart';
import 'package:pure_minds/core/services/local_storage/storage_keys.dart';
import 'package:pure_minds/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  ThemeData? selectedTheme;

  @override
  void emit(SettingsStates state) {
    if (isClosed) return;
    super.emit(state);
  }

  SettingsCubit() : super(SettingsInitialState()) {
    init();
    selectedTheme = MyTheme.mainTheme;
  }

  Locale? appLocale;

  void init() {
    String? storedLocale =
        di<SharedPreferences>().getString(StorageKeys.locale);
    appLocale =
        storedLocale != null ? Locale(storedLocale) : const Locale("en");
    final isLight = di<SharedPreferences>().getBool(StorageKeys.lightTheme);
    if (isLight == false) _isLight = false;
  }

  Future<void> switchAppLocale(String newLan) async {
    if (newLan == appLocale?.languageCode) return;
    emit(SettingsLoadingState());
    await Future.delayed(Durations.short4);
    if (newLan == "ar") {
      appLocale = L10n.supportedLocales[1];
      // di<ApiClient>().changeLocale("ar");
      await di<SharedPreferences>().setString(StorageKeys.locale, "ar");
    } else {
      appLocale = L10n.supportedLocales[0];
      // di<ApiClient>().changeLocale("en");
      await di<SharedPreferences>().setString(StorageKeys.locale, "en");
    }
    emit(SettingsSetLangState());
  }

  bool _isLight = true;
  bool get isLight => _isLight;
  void changeTheme(String theme) {
    emit(SettingsLoadingState());
    _isLight = (theme == "light");
    emit(SettingsSetThemeState());
    di<SharedPreferences>().setBool(StorageKeys.lightTheme, _isLight);
  }
}
