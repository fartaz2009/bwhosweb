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
        OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
        OneSignal.Debug.setAlertLevel(OSLogLevel.none);
        OneSignal.consentRequired(false);
        String oneSignalAppId = appConfig['onesignal_configuration']?['app_id'] ?? getStringAsync(ONESIGNAL_APP_ID, defaultValue: mOneSignalID);
        if (oneSignalAppId.isNotEmpty) {
          OneSignal.initialize(oneSignalAppId);
          OneSignal.Notifications.requestPermission(true);
          OneSignal.Notifications.addForegroundWillDisplayListener((event) {
            print('NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');
            event.preventDefault();
            event.notification.display();
          });
        }
      }
      runApp(MyApp());
    }

    class MyApp extends StatefulWidget {
      MyApp();

      @override
      _MyAppState createState() => _MyAppState();
    }

    class _MyAppState extends State<MyApp> {
      late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

      @override
      void initState() {
        super.initState();
        setStatusBarColor(appStore.primaryColors, statusBarBrightness: Brightness.light);
        _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> e) async {
          if (e.contains(ConnectivityResult.none)) {
            appStore.setConnectionState(ConnectivityResult.none);
            log('not connected');
            push(NoInternetConnection());
          } else {
            appStore.setConnectionState(e.first);
            pop();
            log('connected');
          }
        });
      }

      @override
      void dispose() {
        super.dispose();
        _connectivitySubscription.cancel();
      }

      @override
      Widget build(BuildContext context) {
        return Observer(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: appStore.isNetworkAvailable ? DataScreen() : NoInternetConnection(),
              supportedLocales: Language.languagesLocale(),
              navigatorKey: navigatorKey,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) => locale,
              locale: Locale(appConfig['appconfiguration']?['appLanuguage'] ?? getStringAsync(APP_LANGUAGE, defaultValue: 'en')),
              theme: lightTheme().copyWith(
                primaryColor: Color(int.parse((appConfig['splash_configuration']?['first_color'] ?? '#3788ff').replaceAll('#', '0xFF'))),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  secondary: Color(int.parse((appConfig['splash_configuration']?['second_color'] ?? '#4581e8').replaceAll('#', '0xFF'))),
                ),
              ),
              darkTheme: darkTheme(),
              themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              scrollBehavior: SBehavior(),
            );
          },
        );
      }
    }