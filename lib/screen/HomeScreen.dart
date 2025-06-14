import 'dart:async';
    import 'dart:convert';
    import 'dart:io';
    import 'package:flutter/material.dart';
    import 'package:flutter_inappwebview/flutter_inappwebview.dart';
    import '../app_localizations.dart';
    import '../component/AppBarComponent.dart';
    import '../component/FloatingComponent.dart';
    import '../component/SideMenuComponent.dart';
    import '../main.dart';
    import '../model/MainResponse.dart';
    import '../screen/DashboardScreen.dart';
    import '../utils/AppWidget.dart';
    import '../utils/common.dart';
    import '../utils/constant.dart';
    import '../utils/loader.dart';
    import 'package:nb_utils/nb_utils.dart';
    import 'package:permission_handler/permission_handler.dart';
    import 'package:share_plus/share_plus.dart';
    import 'package:store_redirect/store_redirect.dart';
    import 'package:url_launcher/url_launcher.dart';
    import 'package:firebase_core/firebase_core.dart';
    import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
    import 'package:firebase_messaging/firebase_messaging.dart';

    class HomeScreen extends StatefulWidget {
      static String tag = '/HomeScreen';

      final String? mUrl, title;

      HomeScreen({this.mUrl, this.title});

      @override
      _HomeScreenState createState() => _HomeScreenState();
    }

    class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
      InAppWebViewController? webViewController;
      PullToRefreshController? pullToRefreshController;

      List<TabsResponse> mTabList = [];
      List<MenuStyleModel> mBottomMenuList = [];

      String? mInitialUrl;

      bool isWasConnectionLoss = false;
      bool mIsPermissionGrant = false;

      InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          userAgent: appConfig['user_agent']?.first['android'] ?? getStringAsync(USER_AGENT),
          mediaPlaybackRequiresUserGesture: false,
          allowFileAccessFromFileURLs: true,
          useOnDownloadStart: true,
          javaScriptCanOpenWindowsAutomatically: true,
          javaScriptEnabled: appConfig['appconfiguration']['isJavascriptEnable'] == "true",
          supportZoom: appConfig['appconfiguration']['isZoomFunctionality'] == "true",
          incognito: getStringAsync(IS_COOKIE) == "true",
        ),
        android: AndroidInAppWebViewOptions(useHybridComposition: true),
        ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true),
      );

      void _getInstanceId() async {
        await Firebase.initializeApp();
        FirebaseInAppMessaging.instance.triggerEvent("");
        FirebaseMessaging.instance.sendMessage();
        FirebaseMessaging.instance.getInitialMessage();
      }

      @override
      void initState() {
        super.initState();

        mTabList = (appConfig['tabs'] as List).map((model) => TabsResponse.fromJson(model)).toList();
        _getInstanceId();
        if (appConfig['appconfiguration']['is_webrtc'] == "true") {
          checkWebRTCPermission();
        }
        pullToRefreshController = PullToRefreshController(
          options: PullToRefreshOptions(
            color: appStore.primaryColors,
            enabled: appConfig['appconfiguration']['is_pull_refresh'] == "true",
          ),
          onRefresh: () async {
            if (Platform.isAndroid) {
              webViewController?.reload();
            } else if (Platform.isIOS) {
              webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
            }
          },
        );
        init();
      }

      Future<bool> checkPermission() async {
        if (Platform.isAndroid) {
          final status = await Permission.storage.status;
          if (status != PermissionStatus.granted) {
            final result = await Permission.storage.request();
            if (result == PermissionStatus.granted) {
              mIsPermissionGrant = true;
              setState(() {});
              return true;
            }
          } else {
            return true;
          }
        } else {
          return true;
        }
        return false;
      }

      @override
      void dispose() {
        init();
        super.dispose();
      }

      Future<void> init() async {
        String? referralCode = getReferralCodeFromNative();
        if (referralCode?.isNotEmpty ?? false) {
          mInitialUrl = referralCode;
        }

        if (appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_BOTTOM_NAVIGATION_SIDE_DRAWER) {
          mBottomMenuList = (appConfig['menu_style'] as List).map((model) => MenuStyleModel.fromJson(model)).toList();
        } else {
          mBottomMenuList = (appConfig['tabs'] as List).map((model) => MenuStyleModel.fromJson(model)).toList();
        }

        if (appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_BOTTOM_NAVIGATION ||
            appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_BOTTOM_NAVIGATION_SIDE_DRAWER) {
          if (mBottomMenuList.isNotEmpty) {
            mInitialUrl = widget.mUrl;
          } else {
            mInitialUrl = appConfig['appconfiguration']['url'];
          }
        } else if (appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_TAB_BAR ||
            appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_SIDE_DRAWER_TABS) {
          if (mTabList.isNotEmpty) {
            mInitialUrl = widget.mUrl;
          } else {
            mInitialUrl = appConfig['appconfiguration']['url'];
          }
        } else {
          mInitialUrl = appConfig['appconfiguration']['url'];
        }

        if (webViewController != null) {
          await webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri(mInitialUrl!)));
        }
      }

      @override
      void didUpdateWidget(HomeScreen oldWidget) {
        super.didUpdateWidget(oldWidget);
        setState(() {
          init();
        });
      }

      @override
      Widget build(BuildContext context) {
        var appLocalization = AppLocalizations.of(context);
        Future<bool> _exitApp() async {
          if (await webViewController!.canGoBack()) {
            webViewController!.goBack();
            return false;
          } else {
            if (appConfig['appconfiguration']['isExitPopupScreen'] == "true") {
              return mConfirmationDialog(() {
                Navigator.of(context).pop(false);
              }, context, appLocalization);
            } else {
              exit(0);
            }
          }
        }

        Widget mLoadWeb({String? mURL}) {
          return Stack(
            children: [
              FutureBuilder(
                future: Future.delayed(Duration(milliseconds: 200)),
                builder: (context, snapshot) {
                  return InAppWebView(
                    initialUrlRequest: URLRequest(url: WebUri(mURL.isEmptyOrNull ? mInitialUrl.validate() : mURL!)),
                    initialOptions: options,
                    pullToRefreshController: pullToRefreshController,
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      if (appConfig['progressbar']['is_progressbar'] == "true") appStore.setLoading(true);
                      setState(() {});
                    },
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {
                        pullToRefreshController!.endRefreshing();
                        if (appConfig['progressbar']['is_progressbar'] == "true") appStore.setLoading(false);
                        setState(() {});
                      }
                    },
                    onLoadStop: (controller, url) async {
                      pullToRefreshController!.endRefreshing();
                      if (appConfig['progressbar']['is_progressbar'] == "true") appStore.setLoading(false);
                      if (appConfig['appconfiguration']['disable_header'] == "true") {
                        webViewController!
                            .evaluateJavascript(
                              source: "javascript:(function() { var head = document.getElementsByTagName('header')[0]; head.parentNode.removeChild(head); })()",
                            )
                            .then((value) => debugPrint('Page finished loading Javascript'))
                            .catchError((onError) => debugPrint('$onError'));
                      }
                      if (appConfig['appconfiguration']['disable_footer'] == "true") {
                        webViewController!
                            .evaluateJavascript(
                              source: "javascript:(function() { var footer = document.getElementsByTagName('footer')[0]; footer.parentNode.removeChild(footer); })()",
                            )
                            .then((value) => debugPrint('Page finished loading Javascript'))
                            .catchError((onError) => debugPrint('$onError'));
                      }
                      setState(() {});
                    },
                    onLoadError: (controller, url, code, message) {
                      if (appConfig['progressbar']['is_progressbar'] == "true") appStore.setLoading(false);
                      pullToRefreshController!.endRefreshing();
                      setState(() {});
                    },
                    shouldOverrideUrlLoading: (controller, navigationAction) async {
                      var uri = navigationAction.request.url;
                      var url = navigationAction.request.url.toString();

                      if (Platform.isAndroid && url.contains("intent")) {
                        if (url.contains("maps")) {
                          var mNewURL = url.replaceAll("intent://", "https://");
                          if (await canLaunchUrl(Uri.parse(mNewURL))) {
                            await launchUrl(Uri.parse(mNewURL), mode: LaunchMode.externalApplication);
                            return NavigationActionPolicy.CANCEL;
                          }
                        } else {
                          String id = url.substring(url.indexOf('id%3D') + 5, url.indexOf('#Intent'));
                          await StoreRedirect.redirect(androidAppId: id);
                          return NavigationActionPolicy.CANCEL;
                        }
                      } else if (url.contains("linkedin.com") ||
                          url.contains("market://") ||
                          url.contains("whatsapp://") ||
                          url.contains("truecaller://") ||
                          url.contains("pinterest.com") ||
                          url.contains("snapchat.com") ||
                          url.contains("youtube.com") ||
                          url.contains("instagram.com") ||
                          url.contains("play.google.com") ||
                          url.contains("mailto:") ||
                          url.contains("tel:") ||
                          url.contains("share=telegram") ||
                          url.contains("messenger.com")) {
                        if (url.contains("https://api.whatsapp.com/send?phone=+")) {
                          url = url.replaceAll("https://api.whatsapp.com/send?phone=+", "https://api.whatsapp.com/send?phone=");
                        } else if (url.contains("whatsapp://send/?phone=%20")) {
                          url = url.replaceAll("whatsapp://send/?phone=%20", "whatsapp://send/?phone=");
                        }
                        if (!url.contains("whatsapp://")) {
                          url = Uri.encodeFull(url);
                        }
                        try {
                          if (await canLaunchUrl(Uri.parse(url))) {
                            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                          } else {
                            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                          }
                          return NavigationActionPolicy.CANCEL;
                        } catch (e) {
                          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                          return NavigationActionPolicy.CANCEL;
                        }
                      } else if (!["http", "https", "chrome", "data", "javascript", "about"].contains(uri!.scheme)) {
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                          return NavigationActionPolicy.CANCEL;
                        }
                      }
                      return NavigationActionPolicy.ALLOW;
                    },
                    onDownloadStartRequest: (controller, downloadStartRequest) {
                      launchUrl(Uri.parse(downloadStartRequest.url.toString()), mode: LaunchMode.externalApplication);
                    },
                    androidOnGeolocationPermissionsShowPrompt: (controller, origin) async {
                      await Permission.location.request();
                      return GeolocationPermissionShowPromptResponse(origin: origin, allow: true, retain: true);
                    },
                    androidOnPermissionRequest: (controller, origin, resources) async {
                      if (resources.isNotEmpty) {
                        resources.forEach((element) async {
                          if (element.contains("AUDIO_CAPTURE")) {
                            await Permission.microphone.request();
                          }
                          if (element.contains("VIDEO_CAPTURE")) {
                            await Permission.camera.request();
                          }
                        });
                      }
                      return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                    },
                  ).visible(isWasConnectionLoss == false);
                },
              ),
              Container(
                color: Colors.white,
                height: context.height(),
                width: context.width(),
                child: Loaders(name: appStore.loaderValues).center(),
              ).visible(appStore.isLoading),
            ],
          );
        }

        Widget mBody() {
          return Container(
            color: appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_FULL_SCREEN ? Colors.white : appStore.primaryColors,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: context.cardColor,
                drawerEdgeDragWidth: 0,
                appBar: appConfig['appconfiguration']['navigationStyle'] != NAVIGATION_STYLE_FULL_SCREEN
                    ? PreferredSize(
                        child: AppBarComponent(
                          onTap: (value) {
                            if (value == RIGHT_ICON_RELOAD) {
                              webViewController!.reload();
                            }
                            if (RIGHT_ICON_SHARE == value) {
                              Share.share(appConfig['share_content']['share']);
                            }
                            if (RIGHT_ICON_CLOSE == value || LEFT_ICON_CLOSE == value) {
                              if (appConfig['appconfiguration']['isExitPopupScreen'] == "true") {
                                mConfirmationDialog(() {
                                  Navigator.of(context).pop(false);
                                }, context, appLocalization);
                              }
                            }
                            if (LEFT_ICON_BACK_1 == value || LEFT_ICON_BACK_2 == value) {
                              _exitApp();
                            }
                            if (LEFT_ICON_HOME == value) {
                              DashBoardScreen().launch(context);
                            }
                          },
                        ),
                        preferredSize: Size.fromHeight(
                          appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_TAB_BAR ||
                                  appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_SIDE_DRAWER_TABS &&
                                      appStore.mTabList.isNotEmpty
                              ? 100.0
                              : 60.0,
                        ),
                      )
                    : PreferredSize(child: SizedBox(), preferredSize: Size.fromHeight(0.0)),
                floatingActionButton: appConfig['appconfiguration']['is_floating_button'] == "true" ? FloatingComponent() : SizedBox(),
                drawer: Drawer(
                  child: SideMenuComponent(onTap: () {
                    mInitialUrl = appConfig['appconfiguration']['url'].isNotEmpty ? appConfig['appconfiguration']['url'] : "https://www.google.com";
                    webViewController!.reload();
                  }),
                ).visible(
                  appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_SIDE_DRAWER ||
                      appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_BOTTOM_NAVIGATION_SIDE_DRAWER ||
                      appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_SIDE_DRAWER_TABS,
                ),
                body: appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_TAB_BAR ||
                        appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_SIDE_DRAWER_TABS &&
                            appStore.mTabList.isNotEmpty
                    ? TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for (int i = 0; i < mTabList.length; i++) mLoadWeb(mURL: mTabList[i].url),
                        ],
                      )
                    : mLoadWeb(mURL: mInitialUrl),
                bottomNavigationBar: appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_BOTTOM_NAVIGATION ||
                        appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_BOTTOM_NAVIGATION_SIDE_DRAWER
                    ? SizedBox()
                    : SizedBox(),
              ),
            ),
          );
        }

        return WillPopScope(
          onWillPop: _exitApp,
          child: appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_TAB_BAR ||
                  appConfig['appconfiguration']['navigationStyle'] == NAVIGATION_STYLE_SIDE_DRAWER_TABS
              ? DefaultTabController(
                  length: appStore.mTabList.length,
                  child: mBody(),
                )
              : mBody(),
        );
      }
    }