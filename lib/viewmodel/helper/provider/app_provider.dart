import 'package:flutter/material.dart';
// import '../../../model/user/ads_in_house_json_object.dart';
// import '../../../model/user/user_profile_json_object.dart';
import '../preference_helper.dart';

class AppProvider extends ChangeNotifier {
  // --------------------- languageApp
  String _languageApp = "";

  get languageApp => _languageApp;

  set languageApp(value) {
    _languageApp = value;
    notifyListeners();
  }

  // --------------------- isNightMode
  bool _isNightMode = preferenceHelper.isNightMode;

  get isNightMode => _isNightMode;

  set isNightMode(value) {
    _isNightMode = value;
    notifyListeners();
  }

  // --------------------- timeServer
  int _timeServer = 0;

  int get timeServer => _timeServer;

  set timeServer(int value) {
    _timeServer = value;
    notifyListeners();
  }

  // // --------------------- userObject
  // User? _userObject = preferenceHelper.userProfile?.user;
  //
  // User? get userObject => _userObject;
  //
  // set userObject(User? value) {
  //   _userObject = value;
  //   notifyListeners();
  // }

  // --------------------- experience
  int _experience = preferenceHelper.experience;

  int get experience => _experience;

  set experience(int value) {
    _experience = value;
    notifyListeners();
  }

  // --------------------- isPremium
  bool _isPremium = preferenceHelper.isPremium();

  bool get isPremium => _isPremium;

  set isPremium(bool value) {
    _isPremium = value;
    notifyListeners();
  }

  // --------------------- isShowTitleQuestion
  bool _isShowTitleQuestion = preferenceHelper.showTitleQuestion;

  get isShowTitleQuestion => _isShowTitleQuestion;

  set isShowTitleQuestion(value) {
    _isShowTitleQuestion = value;
    notifyListeners();
  }

  // --------------------- fontSizeChange
  int _fontSizeChange = preferenceHelper.fontSizeChange;

  int get fontSizeChange => _fontSizeChange;

  set fontSizeChange(int value) {
    _fontSizeChange = value;
    notifyListeners();
  }

  // --------------------- bannerTop1
  // BannerObject? _bannerTop1;
  //
  // BannerObject? get bannerTop1 => _bannerTop1;
  //
  // set bannerTop1(BannerObject? value) {
  //   _bannerTop1 = value;
  //   notifyListeners();
  // }

  // --------------------- expandBannerTop1
  int _expandBannerTop1 = -1; // đếm ngược > 0 thì auto expand.

  int get expandBannerTop1 => _expandBannerTop1;

  set expandBannerTop1(int value) {
    _expandBannerTop1 = value;
    notifyListeners();
  }

  // --------------------- activeBannerTop1
  bool _activeBannerTop1 = false; // để show animate lần đầu hiện banner

  bool get activeBannerTop1 => _activeBannerTop1;

  set activeBannerTop1(bool value) {
    _activeBannerTop1 = value;
    notifyListeners();
  }

  // // --------------------- bannerListTop2
  // List<BannerObject>? _bannerListTop2;
  //
  // List<BannerObject>? get bannerListTop2 => _bannerListTop2;
  //
  // set bannerListTop2(List<BannerObject>? value) {
  //   _bannerListTop2 = value;
  //   notifyListeners();
  // }
  //
  // // --------------------- isCloseBannerTop2
  // bool _isCloseBannerTop2 = false;
  //
  // bool get isCloseBannerTop2 => _isCloseBannerTop2;
  //
  // set isCloseBannerTop2(bool value) {
  //   _isCloseBannerTop2 = value;
  //   notifyListeners();
  // }
  //
  // // --------------------- bannerListTop3
  // List<BannerObject>? _bannerListTop3;
  //
  // List<BannerObject>? get bannerListTop3 => _bannerListTop3;
  //
  // set bannerListTop3(List<BannerObject>? value) {
  //   _bannerListTop3 = value;
  //   notifyListeners();
  // }

  // // --------------------- skuForever
  // String _skuForever = GlobalHelper.skuLifetime;
  //
  // get skuForever => _skuForever;
  //
  // set skuForever(value) {
  //   _skuForever = value;
  //   notifyListeners();
  // }

  // // --------------------- sku6Months
  // String _sku6Months = GlobalHelper.sku6Months;
  //
  // get sku6Months => _sku6Months;
  //
  // set sku6Months(value) {
  //   _sku6Months = value;
  //   notifyListeners();
  // }

  // --------------------- paddingBottom
  // insetsBottom hoặc bannerHeight
  double _paddingBottom = preferenceHelper.paddingInsetsBottom;

  get paddingBottom => _paddingBottom;

  set paddingBottom(value) {
    _paddingBottom = value;
    notifyListeners();
  }

  // --------------------- bannerHeight
  double _bannerHeight = 0;

  get bannerHeight => _bannerHeight;

  set bannerHeight(value) {
    _bannerHeight = value;
    notifyListeners();
  }

  // --------------------- tipFavorite
  String _tipFavorite = preferenceHelper.tipFavorite;

  String get tipFavorite => _tipFavorite;

  set tipFavorite(value) {
    _tipFavorite = value;
    notifyListeners();
  }

  // --------------------- appStoreLink
  String _appStoreLink = "";

  String get appStoreLink => _appStoreLink;

  set appStoreLink(value) {
    _appStoreLink = value;
    notifyListeners();
  }

  // --------------------- option display flashcard
  int _displayOption = preferenceHelper.displayOption;

  int get displayOption => _displayOption;

  set displayOption(int value) {
    _displayOption = value;
    notifyListeners();
  }

}
