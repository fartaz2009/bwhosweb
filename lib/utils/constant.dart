// With PHP backend
const String BASE_URL = "http://192.168.88.8/alexai/webadmin/";
const String JSON_CONFIG = "http://192.168.88.8/alexai/webadmin/upload/app_config.json";

// Without PHP backend
const String PURCHASE_CODE = "";
const String BASE_URL_OFFLINE = "https://meetmighty.com/mightyweb-public/view/getjson.php?user=$PURCHASE_CODE";

// Preference
const String mOneSignalID = "ONESIGNAL_APP_ID"; // Key for shared preferences

// AdMob IDs
const String AD_MOB_BANNER_ID = "admobBannerID";
const String AD_MOB_INTERSTITIAL_ID = "admobIntentialID";
const String AD_MOB_BANNER_ID_IOS = "admobBannerIDIOS";
const String AD_MOB_INTERSTITIAL_ID_IOS = "admobIntentialIDIOS";

// Facebook Ads
const String FACEBOOK_BANNER_PLACEMENT_ID = "facebookBannerID";
const String FACEBOOK_INTERSTITIAL_PLACEMENT_ID = "facebookIntentialID";
const String FACEBOOK_BANNER_PLACEMENT_ID_IOS = "facebookBannerIDIOS";
const String FACEBOOK_INTERSTITIAL_PLACEMENT_ID_IOS = "facebookIntentialIDIOS";

const String ADD_TYPE = "ads_type";
const String NONE = "none";
const String isGoogleAds = "admob";
const String isFacebookAds = "facebook";

// Theme colors
const String APP_PRIMARY_COLOR = "PRIMARY_COLOR";
const String APP_SECONDARY_COLOR = "SECONDARY_COLOR";
const String APP_DEFAULT_PRIMARY_COLOR = "#3788FF"; // From app_config.json
const String APP_DEFAULT_SECONDARY_COLOR = "#4581E8"; // From app_config.json
const String APP_SCAFFOLD_DARK_COLOR = "#121212";
const String APP_CARD_DARK_COLOR = "#1E1E1E";

// App configuration
const String APPNAME = "app_name";
const String APPLOGO = "app_logo";
const String URL = "url";
const String ISFULLSCREEN = "isFullscreen";
const String IS_JAVASCRIPT_ENABLE = "isJavascriptEnable";
const String IS_SPLASH_SCREEN = "isSplashScreen";
const String APP_LANGUAGE = "appLanuguage";
const String IS_ZOOM_FUNCTIONALITY = "isZoomFunctionality";
const String NAVIGATIONSTYLE = "navigationStyle";
const String HEADERSTYLE = "header_style";
const String IS_WEBRTC = "is_webrtc";
const String IS_WALKTHROUGH = "is_walkthrough";
const String WALKTHROUGH = "walkthrough";
const String FLOATING_LOGO = "floating_logo";
const String IS_FLOATING = "is_floating_button";
const String FLOATING_STYLE = "floating_button_style";
const String FLOATING_DATA = "floating_button";
const String TAB_BAR_STYLE = "tab_style";
const String IS_PULL_TO_REFRESH = "is_pull_refresh";
const String IS_COOKIE = "clear_cookie";
const String BOTTOM_NAVIGATION_STYLE = "bottom_navigation";
const String WALK_THROUGH_STYLE = "walkthrough_style";
const String IS_Exit_POP_UP = "isExitPopupScreen";
const String DISABLE_HEADER = "disable_header";
const String DISABLE_FOOTER = "disable_footer";

// Loader
const String LOADER_STYLE = "loaderStyle";
const String IS_LOADER = "is_progressbar";

// Theme
const String THEME_STYLE = "themeStyle";
const String GRADIENT1 = "gradientColor1";
const String GRADIENT2 = "gradientColor2";
const String CUSTOM_COLOR = "customColor";

// About
const String IS_SHOW_ABOUT = "isShowAbout";
const String WHATS_APP_NUMBER = "whatsAppNumber";
const String INSTA_GRAM_URL = "instagramUrl";
const String TWITTER_URL = "twitterUrl";
const String FACEBOOK_URL = "facebookUrl";
const String CALL_NUMBER = "callNumber";
const String SKYPE = "skype";
const String SNAPCHAT = "snapchat";
const String YOUTUBE = "youtube";
const String MESSENGER = "messenger";
const String COPYRIGHT = "copyright";
const String DESCRIPTION = "description";

// Menu
const String MENU_STYLE = "menu_style";
const String LEFTICON = "lefticon";
const String RIGHTICON = "righticon";
const String BOTTOMMENU = "bottom_menu";
const String BOTTOMSIDEMENU = "bottom_side_menu";

// OneSignal
const String ONESIGNAL = "onesignal_configuration";
const String IS_FIRST_TIME = "IS_FIRST_TIME";

// Other
const String IS_FROM_TRY_WEBSITE = "is_from_try_website";
const String DETAIL_PAGE_VARIANT = "DetailPageVariant";
const String DETAIL_PAGE_VARIANT1 = "DetailPageVariant1";
const String THEME_VARIANT = "ThemeVariant";
const String LOADER_VARIANT = "LoaderVariant";
const String isDarkModeOnPref = "isDarkModeOnPref";
const String USER_AGENT = "user_agent";
const String TABS = "tabs";
const String PAGES = "pages";

// Icon values
const String RIGHT_ICON_RELOAD = "ic_reload";
const String RIGHT_ICON_SHARE = "ic_share";
const String RIGHT_ICON_CLOSE = "ic_close";
const String RIGHT_ICON_EXIT = "ic_exit";
const String RIGHT_ICON_SEARCH = "ic_search";
const String RIGHT_ICON_SETTINGS = "ic_settings";
const String RIGHT_ICON_CART = "ic_cart";
const String RIGHT_ICON_PROFILE = "ic_profile";
const String RIGHT_ICON_MESSAGE = "ic_message";
const String RIGHT_ICON_NOTIFICATION = "ic_notification";
const String RIGHT_ICON_USER = "ic_user";
const String RIGHT_ICON_LIST = "ic_list";
const String RIGHT_ICON_GRID = "ic_grid";
const String RIGHT_ICON_FILTER = "ic_filter";
const String RIGHT_ICON_FAVOURITE = "ic_favourite";
const String RIGHT_ICON_CHAT = "ic_chat";
const String RIGHT_ICON_ABOUT = "ic_about";
const String RIGHT_ICON_SCAN = "ic_qr_code";

const String LEFT_ICON_BACK_1 = "ic_back1";
const String LEFT_ICON_BACK_2 = "ic_back2";
const String LEFT_ICON_HOME = "ic_home";
const String LEFT_ICON_PROFILE = "ic_profile";
const String LEFT_ICON_CLOSE = "ic_close";
const String LEFT_ICON_SEARCH = "ic_search";
const String LEFT_ICON_ADD = "ic_add";

const String HEADER_STYLE_CENTER = "center";
const String HEADER_STYLE_EMPTY = "empty_header";

const String THEME_STYLE_GRADIENT = "Gradient";
const String THEME_STYLE_DEFAULT = "Default";
const String THEME_STYLE_CUSTOM = "Custom";

const String NAVIGATION_STYLE_SIDE_DRAWER = "sidedrawer";
const String NAVIGATION_STYLE_BOTTOM_NAVIGATION = "bottom_navigation";
const String NAVIGATION_STYLE_FULL_SCREEN = "fullscreen";
const String NAVIGATION_STYLE_TAB_BAR = "tabs";
const String NAVIGATION_STYLE_SIDE_DRAWER_TABS = "sidedrawer_tabs";
const String NAVIGATION_STYLE_BOTTOM_NAVIGATION_SIDE_DRAWER = "sidedrawer_bottom_navigation";

const String SIMPLE_TAB = "simple_tab";
const String TAB_WITH_ICON = "tab_with_icon";
const String TAB_WITH_ICON_TITLE = "tab_with_title_icon";

const String WALK_THROUGH_1 = "walkthrough_style_1";
const String WALK_THROUGH_2 = "walkthrough_style_2";
const String WALK_THROUGH_3 = "walkthrough_style_3";

const String BOTTOM_NAVIGATION_1 = "bottom_navigation_1";
const String BOTTOM_NAVIGATION2 = "bottom_navigation_2";
const String BOTTOM_NAVIGATION3 = "bottom_navigation_3";

const String SPLASH_FIRST_COLOR = "first_color";
const String SPLASH_SECOND_COLOR = "second_color";
const String SPLASH_TITLE = "title";
const String SPLASH_ENABLE_TITLE = "enable_title";
const String SPLASH_ENABLE_LOGO = "enable_logo";
const String SPLASH_ENABLE_BACKGROUND = "enable_background";
const String SPLASH_LOGO_URL = "splash_logo_url";
const String SPLASH_TITLE_COLOR = "title_color";
const String SPLASH_BACKGROUND_URL = "splash_background_url";

const String EXIST_ICON = "exit_image_url";
const String EXIST_TITLE = "title";
const String EXIST_NEGATIVE_TEXT = "negative_text";
const String EXIST_POSITIVE_TEXT = "positive_text";
const String EXIST_ENABLE_ICON = "enable_image";

const String SHARE_CONTENT = "share_content";

// Theme color names
List<String> themeName = [
  "Theme1",
  "Theme2",
  "Theme3",
  "Theme4",
  "Theme5",
  "Theme6",
  "Theme7",
  "Theme8",
  "Theme9",
  "Theme10",
  "Theme11",
  "Theme12",
  "Theme13",
  "Theme14",
  "Theme15",
];

List<String> colorName = [
  "#880e4f",
  "#e667b1",
  "#4a148c",
  "#b71c1c",
  "#1a237e",
  "#0d47a1",
  "#01579b",
  "#094c4f",
  "#bfc726",
  "#1b5e20",
  "#ba8d06",
  "#6835f2",
  "#212121",
  "#263238",
  "#dd2c00",
  "#1b5ddb",
];

List<String> loaderName = [
  "RotatingPlane",
  "DoubleBounce",
  "WanderingCubes",
  "Pulse",
  "ChasingDots",
  "FadingFour",
  "Circle",
  "CubeGrid",
  "FadingCircle",
  "FoldingCube",
  "RotatingCircle",
  "Wave",
  "Ring",
];

// Visibility
const bool EnableHome = true;
const bool EnableDemo = false;
const bool EnableMode = true;