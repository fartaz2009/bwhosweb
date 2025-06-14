name: bwhosweb
    description: A new Flutter application.
    version: 1.0.0+1

    environment:
      sdk: '>=3.3.0 <4.0.0'

    dependencies:
      flutter:
        sdk: flutter

      # BASE
      nb_utils: ^7.1.4
      # google_fonts: ^6.1.0

      # UI
      cached_network_image: ^3.3.1
      flutter_spinkit: ^5.2.0
      package_info_plus: ^5.0.1
      flutter_speed_dial: ^7.0.0
      flutter_native_splash: ^2.4.0

      # STATE MANAGEMENT
      mobx: ^2.3.0+1
      flutter_mobx: ^2.2.0+2

      # STORAGE & PERMISSION
      permission_handler: ^11.3.0
      path_provider: ^2.1.2
      provider: ^6.1.2

      # CONNECTIVITY
      http: ^1.2.1
      share_plus: ^7.2.2
      url_launcher: ^6.2.5
      store_redirect: ^2.0.4

      # Firebase
      firebase_in_app_messaging: ^0.7.4+18
      firebase_messaging: ^14.7.20
      firebase_core: ^2.27.1

      # PUSH NOTIFICATION
      onesignal_flutter: ^5.1.2

      # WEB TOOLS
      flutter_inappwebview: ^6.0.0

      flutter_localizations:
        sdk: flutter

    dev_dependencies:
      flutter_test:
        sdk: flutter
      build_runner: ^2.4.8
      mobx_codegen: ^2.6.0+1
      flutter_launcher_icons: ^0.13.1

    dependency_overrides:
      js: ^0.6.7
      http: ^1.2.1
      web: ^0.5.1

    flutter:
      uses-material-design: true
      assets:
        - assets/
        - lang/
        - assets/app_config.json
        - assets/icons/
        - assets/images/

    flutter_launcher_icons:
      android: true
      ios: true
      image_path: "assets/icons/app_logo.png"
      min_sdk_android: 21
      remove_alpha_ios: true
      adaptive_icon_background: "#FFFFFF"
      adaptive_icon_foreground: "assets/icons/app_logo.png"

    flutter_native_splash:
      color: "#FFFFFF"
      image: assets/images/splash_logo.png
      android: true
      ios: true
      fullscreen: true
