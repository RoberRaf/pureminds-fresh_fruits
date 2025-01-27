import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/cubits/settings_cubit/settings_cubit.dart';
import 'package:pure_minds/core/cubits/settings_cubit/settings_states.dart';
import 'package:pure_minds/features/splash/splash_screen.dart';

class PureMindsApp extends StatelessWidget {
  const PureMindsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsCubit(), lazy: false),
      ],
      child: Builder(
        builder: (ctx) => BlocBuilder<SettingsCubit, SettingsStates>(
          builder: (context, state) => MaterialApp(
            title: "Tabali App",
            theme: MyTheme.mainTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: context.read<SettingsCubit>().isLight
                ? ThemeMode.light
                : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            // initialRoute: Routes.splashScreen,
            // home: const SplashScreen(),
            navigatorKey: AppConsts.navigatorKey,
            // onGenerateRoute: RouteGenerator.onGenerateRoute,
            localizationsDelegates: L10n.localizationDelegates,
            supportedLocales: L10n.supportedLocales,
            localeResolutionCallback: L10n.setFallbackLocale,
            locale:
                BlocProvider.of<SettingsCubit>(ctx, listen: true).appLocale,
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
