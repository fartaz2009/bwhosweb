import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import '../model/MainResponse.dart';
import '../utils/constant.dart';
import '../main.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isDarkModeOn = false;

  @observable
  bool isNetworkAvailable = true;

  @observable
  Color primaryColors = Color(int.parse(APP_DEFAULT_PRIMARY_COLOR.replaceAll('#', '0xFF')));

  @observable
  String? loaderValues = '';

  @observable
  String? url;

  @observable
  int currentIndex = 0;

  @observable
  String? selectedLanguageCode;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<TabsResponse> mTabList = ObservableList<TabsResponse>();

  @observable
  ObservableList<FloatingButton> mFABList = ObservableList<FloatingButton>();

  @observable
  ObservableList<Walkthrough> mOnBoardList = ObservableList<Walkthrough>();

  @observable
  ObservableList<MenuStyleModel> mBottomNavigationList = ObservableList<MenuStyleModel>();

  @observable
  ObservableList<TabsResponse> mPageList = ObservableList<TabsResponse>();

  @observable
  ObservableList<MenuStyleModel> mMenuList = ObservableList<MenuStyleModel>();

  @computed
  bool get isDarkMode => isDarkModeOn;

  @action
  void setLoading(bool val) {
    isLoading = val;
  }

  @action
  void setConnectionState(ConnectivityResult val) {
    isNetworkAvailable = val != ConnectivityResult.none;
  }

  @action
  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;
    await setValue(isDarkModeOnPref, isDarkModeOn);
    setStatusBarColor(primaryColors);
  }

  @observable
  String? deepLinkURL;

  @action
  void setDeepLinkURL(String val) {
    deepLinkURL = val;
  }

  @action
  void addToTabList(TabsResponse val) {
    mTabList.add(val);
  }

  @action
  void addToPageList(TabsResponse val) {
    mPageList.add(val);
  }

  @action
  void addToOnBoardList(Walkthrough val) {
    mOnBoardList.add(val);
  }

  @action
  void addToFabList(FloatingButton val) {
    mFABList.add(val);
  }

  @action
  void addToBottomNavigationList(MenuStyleModel val) {
    mBottomNavigationList.add(val);
  }

  @action
  void addToMenuList(MenuStyleModel val) {
    mMenuList.add(val);
  }

  @action
  Future<void> setDarkMode({bool? aIsDarkMode}) async {
    isDarkModeOn = aIsDarkMode ?? false;
    await setValue(isDarkModeOnPref, isDarkModeOn);
    setStatusBarColor(primaryColors);
  }

  @action
  void setPrimaryColor(Color value) {
    primaryColors = value;
  }

  @action
  void setLoader(String? value) {
    loaderValues = value;
  }

  @action
  void setURL(String value) {
    url = value;
  }

  @action
  void setIndex(int value) {
    currentIndex = value;
  }

  @action
  Future<void> setLanguage(String? aSelectedLanguageCode) async {
    selectedLanguageCode = aSelectedLanguageCode;
    await setValue(APP_LANGUAGE, aSelectedLanguageCode);
  }
}
