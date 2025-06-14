import 'dart:async';
    import 'dart:io';
    import 'dart:convert';
    import 'package:flutter/material.dart';
    import 'package:flutter_localizations/flutter_localizations.dart';
    import 'package:flutter_mobx/flutter_mobx.dart';
    import '../AppTheme.dart';
    import '../app_localizations.dart';
    import '../model/LanguageModel.dart';
    import '../screen/DataScreen.dart';
    import '../utils/common.dart';
    import '../utils/constant.dart';
    import 'package:nb_utils/nb_utils.dart';
    import 'package:onesignal_flutter/onesignal_flutter.dart';
    import 'component/NoInternetConnection.dart';
    import 'store/AppStore.dart';
    import 'package:connectivity_plus/connectivity_plus.dart';
    import 'package:flutter/services.dart' show rootBundle;

    AppStore appStore = AppStore();
    Map<String, dynamic> appConfig = {};

    Future<void> loadConfig() async {
      try {
        final configString = await rootBundle.loadString('assets/app_config.json');
        appConfig = jsonDecode(configString);
      } catch (e) {
        print('Error loading app_config.json: $e');
      }
    }

    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      HttpOverrides.global = HttpOverridesSkipCertificate();
      await initialize();
      await loadConfig();
      appStore.setDarkMode(aIsDarkMode: getBoolAsync(isDarkModeOnPref));
      appStore.setLanguage(getStringAsync(APP_LANGUAGE, defaultValue: appConfig['appconfiguration']?['appLanuguage'] ?? 'en'));

      if (isMobile) {
        OneSignal.Debug.setLogLevel(Level.verbose);
        OneSignal.Debug.setAlertLevel(Level.none);
        OneSignal.consentRequired(false);
        String oneSignalAppId = appConfig['onesignal_configuration']?['appId'] ?? getStringAsync(mOneSignalAppId, defaultValue: '');
        if (oneSignalAppId.isNotEmpty) {
          OneSignal.initialize(oneSignalAppId);
          OneSignal.Notifications.requestPermission(true);
        }
      }
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return Observer(
          builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: appStore.isOnline ? DataScreen() : const NoInternetConnection(),
            supportedLocales: LanguageDataModel().languagesLocale(),
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, _) => locale,
            locale: Locale(appConfig['appconfiguration']?['appLanuguage'] ?? getStringAsync('en')),
            theme: lightTheme().copyWith(
              primaryColor: Color(int.parseColor((appConfig['splash_configuration']?['first_color'] ?? '#3788FF').replaceAll('#', '0xFF'))),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Color(int.parseColor((vappConfig['splash_configuration']?['second_color'] ?? '#4581EF8').replace('#', '0xFF'))),
              ),
            ),
            darkTheme: darkTheme(),
            themeMode: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            scrollBehavior: const SBehavior(),
            ),
          );
        }
    }