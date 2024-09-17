import 'dart:convert';
// import 'package:heyfrance/viewmodel/helper/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


late PreferenceHelper preferenceHelper;

class PreferenceHelper {
  SharedPreferences? _prefs;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
    return;
  }

  static Future<PreferenceHelper> getInstance() async {
    var preferences = PreferenceHelper();
    preferences._prefs = await SharedPreferences.getInstance();
    return preferences;
  }

  // ----------------------- firstOpenApp
  final _firstOpenApp = "first_open_app";

  bool get checkFirstOpenApp {
    return _prefs?.getBool(_firstOpenApp) ?? true;
  }

  set checkFirstOpenApp(bool value) {
    _prefs?.setBool(_firstOpenApp, value);
  }

  // ----------------------- appBarHeight
  final _appBarHeight = "app_bar_height";

  get appBarHeight {
    return _prefs?.getDouble(_appBarHeight) ?? 0;
  }

  set appBarHeight(height) {
    _prefs?.setDouble(_appBarHeight, height);
  }

  // ----------------------- paddingInsetsBottom
  final _paddingInsetsBottom = "padding_insets_bottom";

  get paddingInsetsBottom {
    return _prefs?.getDouble(_paddingInsetsBottom) ?? 0;
  }

  set paddingInsetsBottom(value) {
    _prefs?.setDouble(_paddingInsetsBottom, value);
  }

  // ----------------------- paddingInsetsTop
  final _paddingInsetsTop = "padding_insets_top";

  get paddingInsetsTop {
    return _prefs?.getDouble(_paddingInsetsTop) ?? 0;
  }

  set paddingInsetsTop(value) {
    _prefs?.setDouble(_paddingInsetsTop, value);
  }

  // ----------------------- widthScreen
  final _widthScreen = "width_screen_3";

  get widthScreen {
    return _prefs?.getDouble(_widthScreen) ?? 0;
  }

  set widthScreen(value) {
    _prefs?.setDouble(_widthScreen, value);
  }

  // ----------------------- heightScreen
  final _heightScreen = "height_screen_3";

  get heightScreen {
    return _prefs?.getDouble(_heightScreen) ?? 0;
  }

  set heightScreen(value) {
    _prefs?.setDouble(_heightScreen, value);
  }

  // ----------------------- screenWidthMinimum
  // get screenWidthMinimum {
  //   if (!Utils.isTablet()) return widthScreen;
  //   return min<double>(widthScreen, heightScreen / 2);
  // }

  // ----------------------- versionApp
  final _versionApp = "version_app";

  get versionApp {
    return _prefs?.getString(_versionApp) ?? "";
  }

  set versionApp(value) {
    _prefs?.setString(_versionApp, value);
  }

  // ----------------------- languageApp
  final _languageApp = "language_app";

  get languageApp {
    return _prefs?.getString(_languageApp) ?? "en";
  }

  set languageApp(value) {
    _prefs?.setString(_languageApp, value);
  }

  // ----------------------- isNightMode
  final _nightMode = "night_mode";

  get isNightMode {
    return _prefs?.getBool(_nightMode) ?? false;
  }

  set isNightMode(value) {
    _prefs?.setBool(_nightMode, value);
  }

  // ----------------------- countryCode
  final _countryCode = "country_code";

  String get countryCode {
    return _prefs?.getString(_countryCode) ?? "en";
  }

  set countryCode(value) {
    _prefs?.setString(_countryCode, value);
  }

  // ----------------------- isReminderActive
  final _reminderActive = "reminder_active";

  get isReminderActive {
    return _prefs?.getBool(_reminderActive) ?? false;
  }

  set isReminderActive(value) {
    _prefs?.setBool(_reminderActive, value);
  }

  // ----------------------- timeReminder
  final _timeReminder = "time_reminder";

  String get timeReminder {
    return _prefs?.getString(_timeReminder) ?? "";
  }

  set timeReminder(String value) {
    _prefs?.setString(_timeReminder, value);
  }

  // ----------------------- openOnBoarding
  final _openOnBoarding = "open_on_boarding";

  get didOpenOnBoarding {
    return _prefs?.getBool(_openOnBoarding) ?? false;
  }

  set didOpenOnBoarding(value) {
    _prefs?.setBool(_openOnBoarding, value);
  }

  // ----------------------- setupLanguage
  final _setupLanguage = "setup_language";

  get isChooseLanguageFirst {
    return _prefs?.getBool(_setupLanguage) ?? false;
  }

  set isChooseLanguageFirst(value) {
    _prefs?.setBool(_setupLanguage, value);
  }

  // ----------------------- timeServer
  final _timeServer = "time_server";

  int get timeServer {
    return _prefs?.getInt(_timeServer) ?? 0;
  }

  set timeServer(int value) {
    _prefs?.setInt(_timeServer, value);
  }

  // ----------------------- idDevice
  final _idDevice = "id_device";

  String get idDevice {
    return _prefs?.getString(_idDevice) ?? "";
  }

  set idDevice(String value) {
    _prefs?.setString(_idDevice, value);
  }

  // ----------------------- checkAddedIdDevice
  final _addedIdDevice = "added_id_device";

  bool get checkAddedIdDevice {
    return _prefs?.getBool(_addedIdDevice) ?? false;
  }

  set checkAddedIdDevice(bool value) {
    _prefs?.setBool(_addedIdDevice, value);
  }

  // ----------------------- checkRemoveIdDevice
  final _removeIdDevice = "remove_id_device";

  bool get checkRemoveIdDevice {
    return _prefs?.getBool(_removeIdDevice) ?? false;
  }

  set checkRemoveIdDevice(bool value) {
    _prefs?.setBool(_removeIdDevice, value);
  }

  // ----------------------- idUserRemoveIdDevice
  final _idRemoveIdDevice = "id_remove_id_device";

  int get idUserRemoveIdDevice {
    return _prefs?.getInt(_idRemoveIdDevice) ?? 0;
  }

  set idUserRemoveIdDevice(int value) {
    _prefs?.setInt(_idRemoveIdDevice, value);
  }

  // ----------------------- tokenRemoveIdDevice
  final _tokenRemoveIdDevice = "token_remove_id_device";

  String get tokenRemoveIdDevice {
    return _prefs?.getString(_tokenRemoveIdDevice) ?? "";
  }

  set tokenRemoveIdDevice(String value) {
    _prefs?.setString(_tokenRemoveIdDevice, value);
  }

  // ----------------------- lessonItemWidth
  final _lessonItemWidth = "lesson_item_width_3";

  get lessonItemWidth {
    return _prefs?.getDouble(_lessonItemWidth) ?? 0;
  }

  set lessonItemWidth(value) {
    _prefs?.setDouble(_lessonItemWidth, value);
  }

  // ----------------------- statusSignIn
  final _statusSignIn = "status_sign_in";

  // 0 logOut, 1 - email, 2 - google, 3: apple
  int get statusSignIn {
    if (userProfileJson.isEmpty) return 0;
    return _prefs?.getInt(_statusSignIn) ?? 0;
  }

  set statusSignIn(int value) {
    _prefs?.setInt(_statusSignIn, value);
    if (value == 0) {
      userProfileJson = "";
      didSyncPremiumAccount = false;
    }
  }

  // ----------------------- userProfileJson
  final _userProfileJson = "user_profile_json";

  String get userProfileJson {
    return _prefs?.getString(_userProfileJson) ?? "";
  }

  set userProfileJson(String value) {
    _prefs?.setString(_userProfileJson, value);
  }

  // UserProfileJSONObject? get userProfile {
  //   if (userProfileJson.isEmpty || statusSignIn == 0) return null;
  //   try {
  //     Map object = jsonDecode(userProfileJson);
  //     var userObject = UserProfileJSONObject.fromJson(object.cast());
  //     return userObject;
  //   } on FormatException {
  //     return null;
  //   }
  // }

  int get idUser {
    // return userProfile?.user?.id ?? 0;
    return 0;
  }

  String get accessToken {
    // return userProfile?.user?.accessToken ?? "";
    return "";
  }

  // ----------------------- versionUnit
  final _versionUnit = "version_unit";

  int get versionUnit {
    return _prefs?.getInt("${_versionUnit}_$languageApp") ?? 0;
  }

  set versionUnit(int value) {
    _prefs?.setInt("${_versionUnit}_$languageApp", value);
  }

  // ----------------------- lessonUnitTotal
  final _unitTotal = "unit_total";

  int getLessonUnitTotal(String keyId) {
    return _prefs?.getInt("${_unitTotal}_$keyId") ?? 0;
  }

  setLessonUnitTotal(int value, String keyId) {
    _prefs?.setInt("${_unitTotal}_$keyId", value);
  }

  // ----------------------- lessonUnitComplete
  final _unitComplete = "unit_complete";

  int getLessonUnitComplete(String keyId) {
    return _prefs?.getInt("${_unitComplete}_${keyId}_$idUser") ?? 0;
  }

  setLessonUnitComplete(int value, String keyId) {
    _prefs?.setInt("${_unitComplete}_${keyId}_$idUser", value);
  }

  int getLessonUnitCompleteNotLogin(String keyId) {
    return _prefs?.getInt("${_unitComplete}_${keyId}_0") ?? 0;
  }

  setLessonUnitCompleteNotLogin(int value, String keyId) {
    _prefs?.setInt("${_unitComplete}_${keyId}_0", value);
  }

  // ----------------------- lessonSync
  final _lessonSync = "lesson_sync_v3";

  String get lessonSync {
    return _prefs?.getString("${_lessonSync}_$languageApp") ?? "";
  }

  set lessonSync(String id) {
    if (!lessonSync.contains("($id)")) {
      _prefs?.setString("${_lessonSync}_$languageApp", "$lessonSync($id)");
    }
  }

  removeLessonSync(String id) {
    var sync = lessonSync;
    if (sync.contains("($id)")) {
      _prefs?.setString(
          "${_lessonSync}_$languageApp", sync.replaceAll("($id)", ""));
    }
  }

  // ----------------------- reloadTestOut
  final _reloadTestOut = "reload_test_out";

  get reloadTestOut {
    return _prefs?.getBool(_reloadTestOut) ?? false;
  }

  set reloadTestOut(value) {
    _prefs?.setBool(_reloadTestOut, value);
  }

  // ----------------------- lessonVersion
  final _lessonVersion = "lesson_version";

  int getLessonVersion(String id) {
    return _prefs?.getInt("${_lessonVersion}_$id") ?? 0;
  }

  setLessonVersion(int value, String id) {
    _prefs?.setInt("${_lessonVersion}_$id", value);
  }

  // ----------------------- documentsPath
  final _documentsPath = "documents_path";

  String get documentsPath {
    return _prefs?.getString(_documentsPath) ?? "";
  }

  set documentsPath(String value) {
    _prefs?.setString(_documentsPath, value);
  }

  // ----------------------- isPremiumCheck
  final _premiumCheck = "premium_check";

  bool isPremium({bool? isAccount}) {
    if (isAccount == null) {
      return isPremium(isAccount: false) || isPremium(isAccount: true);
    }
    return _prefs
            ?.getBool("${_premiumCheck}_${isAccount ? "user" : "store"}") ??
        false;
  }

  setPremium(bool isPremium, bool isAccount) {
    // isAccount: true: user - false: store
    _prefs?.setBool(
        "${_premiumCheck}_${isAccount ? "user" : "store"}", isPremium);
  }

  // ----------------------- premiumPackage
  final _premiumPackage = "premium_package";

  String getPremiumPackage(bool isAccount) {
    return _prefs
            ?.getString("${_premiumPackage}_${isAccount ? "user" : "store"}") ??
        "";
  }

  setPremiumPackage(String package, bool isAccount) {
    _prefs?.setString(
        "${_premiumPackage}_${isAccount ? "user" : "store"}", package);
  }

  // ----------------------- expiredTime
  final _expiredTime = "expired_time";

  int getExpiredTime(String package, bool isAccount) {
    return _prefs?.getInt(
            "${_expiredTime}_${package}_${isAccount ? "user" : "store"}") ??
        0;
  }

  setExpiredTime(int time, String package, bool isAccount) {
    _prefs?.setInt(
        "${_expiredTime}_${package}_${isAccount ? "user" : "store"}", time);
  }

  // ----------------------- purchasedExpire
  final _purchasedExpire = "purchased_expire";

  int getPurchasedExpire(String purchaseID) {
    return _prefs?.getInt("${_purchasedExpire}_$purchaseID") ?? 0;
  }

  setPurchasedExpire(int time, String purchaseID) {
    _prefs?.setInt("${_purchasedExpire}_$purchaseID", time);
  }

  // ----------------------- typePremiumPriority
  int get typePremiumPriority {
    // 0: no premium - 1: store - 2: user
    if (!isPremium()) return 0;
    if (!isPremium(isAccount: true)) return 1;
    if (!isPremium(isAccount: false)) return 2;

    final timeExpiredStore = getExpiredTime(getPremiumPackage(false), false);
    final timeExpiredUser = getExpiredTime(getPremiumPackage(true), true);
    if (timeExpiredStore > timeExpiredUser) return 1;
    return 2;
  }

  // ----------------------- isSyncPremiumAccount
  final _syncPremiumAccount = "sync_premium_account";

  bool get didSyncPremiumAccount {
    return _prefs?.getBool(_syncPremiumAccount) ?? false;
  }

  set didSyncPremiumAccount(bool value) {
    _prefs?.setBool(_syncPremiumAccount, value);
  }

  // ----------------------- dayOfMonth
  final _dayOfMonth = "day_of_month";

  String get dayOfMonth {
    return _prefs?.getString(_dayOfMonth) ?? "";
  }

  set dayOfMonth(String value) {
    _prefs?.setString(_dayOfMonth, value);
  }

  // ----------------------- dayOfWeek
  final _dayOfWeek = "day_of_week";

  String get dayOfWeek {
    return _prefs?.getString(_dayOfWeek) ?? "";
  }

  set dayOfWeek(String value) {
    _prefs?.setString(_dayOfWeek, value);
  }

  // ----------------------- lessonCached
  final _lessonCached = "lesson_cached";

  String get lessonCached {
    return _prefs?.getString(_lessonCached) ?? "";
  }

  set lessonCached(String value) {
    _prefs?.setString(_lessonCached, value);
  }

  // List<LessonCachedObject> get lessonCachedList {
  //   try {
  //     List<dynamic> objects = jsonDecode(lessonCached);
  //     var lessonList = List<LessonCachedObject>.from(
  //         objects.map((e) => LessonCachedObject.fromJson(e)));
  //     return lessonList;
  //   } on FormatException {
  //     return [];
  //   }
  // }

  // ----------------------- userLevelCached
  final _userLevelCached = "user_level_cached";

  String get userLevelCached {
    return _prefs?.getString(_userLevelCached) ?? "";
  }

  set userLevelCached(String value) {
    _prefs?.setString(_userLevelCached, value);
  }

  // List<LevelUserCachedObject> get userLevelCachedList {
  //   try {
  //     List<dynamic> objects = jsonDecode(userLevelCached);
  //     var lessonList = List<LevelUserCachedObject>.from(
  //         objects.map((e) => LevelUserCachedObject.fromJson(e)));
  //     return lessonList;
  //   } on FormatException {
  //     return [];
  //   }
  // }

  // ----------------------- percentCorrect
  final _percentCorrect = "percent_correct";

  String get percentCorrect {
    return _prefs?.getString("${_percentCorrect}_$idUser") ?? "";
  }

  set percentCorrect(String value) {
    _prefs?.setString("${_percentCorrect}_$idUser", value);
  }

  String get percentCorrectNotLogin {
    return _prefs?.getString("${_percentCorrect}_0") ?? "";
  }

  set percentCorrectNotLogin(String value) {
    _prefs?.setString("${_percentCorrect}_0", value);
  }

  // ----------------------- experience
  final _experience = "experience";

  int get experience {
    return _prefs?.getInt("${_experience}_$idUser") ?? 0;
  }

  set experience(int value) {
    _prefs?.setInt("${_experience}_$idUser", value);
  }

  int get experienceNotLogin {
    return _prefs?.getInt("${_experience}_0") ?? 0;
  }

  set experienceNotLogin(int value) {
    _prefs?.setInt("${_experience}_0", value);
  }

  // ----------------------- loginDaily
  final _loginDaily = "login_daily";

  String get loginDaily {
    return _prefs?.getString("${_loginDaily}_$idUser") ?? "";
  }

  set loginDaily(String value) {
    _prefs?.setString("${_loginDaily}_$idUser", value);
  }

  // ----------------------- processWeek
  final _processWeek = "process_week";

  String get processWeek {
    return _prefs?.getString("${_processWeek}_$idUser") ?? "";
  }

  set processWeek(String value) {
    _prefs?.setString("${_processWeek}_$idUser", value);
  }

  // ExpObject? get processWeekObject {
  //   final jsonString = processWeek;
  //   if (jsonString.isEmpty) return null;
  //
  //   final jsonProcess = jsonString.replaceAll("()", "\"");
  //
  //   try {
  //     Map object = jsonDecode(jsonProcess);
  //     var processObject = ExpObject.fromJson(object.cast());
  //     return processObject;
  //   } on FormatException {
  //     return null;
  //   }
  // }

  set processWeekNotLogin(String value) {
    _prefs?.setString("${_processWeek}_0", value);
  }

  // ExpObject? get processWeekObjectNotLogin {
  //   final jsonString = _prefs?.getString("${_processWeek}_0") ?? "";
  //   if (jsonString.isEmpty) return null;
  //
  //   final jsonProcess = jsonString.replaceAll("()", "\"");
  //
  //   try {
  //     Map object = jsonDecode(jsonProcess);
  //     var processObject = ExpObject.fromJson(object.cast());
  //     return processObject;
  //   } on FormatException {
  //     return null;
  //   }
  // }

  // ----------------------- processDaily
  final _processDaily = "process_daily";

  String get processDaily {
    return _prefs?.getString("${_processDaily}_$idUser") ?? "";
  }

  set processDaily(String value) {
    _prefs?.setString("${_processDaily}_$idUser", value);
  }

  // List<ProcessDailyObject>? get processDailyObject {
  //   final jsonString = processDaily;
  //   if (jsonString.isEmpty) return null;
  //
  //   final jsonProcess = jsonString.replaceAll("()", "\"");
  //
  //   try {
  //     List<dynamic> objects = jsonDecode(jsonProcess);
  //     var processObject = List<ProcessDailyObject>.from(
  //         objects.map((e) => ProcessDailyObject.fromJson(e)));
  //     return processObject;
  //   } on FormatException {
  //     return null;
  //   }
  // }

  set processDailyNotLogin(String value) {
    _prefs?.setString("${_processDaily}_0", value);
  }

  // List<ProcessDailyObject>? get processDailyObjectNotLogin {
  //   final jsonString = _prefs?.getString("${_processDaily}_0") ?? "";
  //   if (jsonString.isEmpty) return null;
  //
  //   final jsonProcess = jsonString.replaceAll("()", "\"");
  //
  //   try {
  //     List<dynamic> objects = jsonDecode(jsonProcess);
  //     var processObject = List<ProcessDailyObject>.from(
  //         objects.map((e) => ProcessDailyObject.fromJson(e)));
  //     return processObject;
  //   } on FormatException {
  //     return null;
  //   }
  // }

  // ----------------------- dataAchievement
  final _dataAchievement = "data_achievement";

  String get achievement {
    return _prefs?.getString("${_dataAchievement}_$idUser") ?? "";
  }

  set achievement(String value) {
    _prefs?.setString("${_dataAchievement}_$idUser", value);
  }

  // AchievementJSONObject? get achievementObject {
  //   final jsonString = achievement;
  //   if (jsonString.isEmpty) return null;
  //
  //   final jsonAchievement = jsonString.replaceAll("()", "\"");
  //
  //   try {
  //     Map object = jsonDecode(jsonAchievement);
  //     var achievementObject = AchievementJSONObject.fromJson(object.cast());
  //     return achievementObject;
  //   } on FormatException {
  //     return null;
  //   }
  // }

  set achievementNotLogin(String value) {
    _prefs?.setString("${_dataAchievement}_0", value);
  }

  // AchievementJSONObject? get achievementObjectNotLogin {
  //   final jsonString = _prefs?.getString("${_dataAchievement}_0") ?? "";
  //   if (jsonString.isEmpty) return null;
  //
  //   final jsonAchievement = jsonString.replaceAll("()", "\"");
  //
  //   try {
  //     Map object = jsonDecode(jsonAchievement);
  //     var achievementObject = AchievementJSONObject.fromJson(object.cast());
  //     return achievementObject;
  //   } on FormatException {
  //     return null;
  //   }
  // }

  // ----------------------- achievementNew
  final _newAchievement = "new_achievement";

  addAchievementNew(int id) {
    final idList = achievementNewList;

    if (!idList.contains(id)) {
      idList.add(id);
      _prefs?.setString(_newAchievement, jsonEncode(idList));
    }
  }

  removeAchievementNew(int id) {
    var idList = achievementNewList;
    if (idList.contains(id)) {
      var pos = -1;
      for (var i = 0; i < idList.length; i++) {
        if (idList[i] == id) {
          pos = i;
          break;
        }
      }
      if (pos != -1) {
        idList.removeAt(pos);

        if (idList.isEmpty) {
          _prefs?.setString(_newAchievement, "");
        } else {
          _prefs?.setString(_newAchievement, jsonEncode(idList));
        }
      }
    }
  }

  List<int> get achievementNewList {
    final jsonString = _prefs?.getString(_newAchievement) ?? "";
    if (jsonString.isEmpty) return [];

    try {
      List<int> objects = (jsonDecode(jsonString) as List<dynamic>).cast<int>();
      return objects;
    } on FormatException {
      return [];
    }
  }

  // ----------------------- adsInHouse
  final _adsInHouse = "ads_in_house";

  String get adsInHouse {
    return _prefs?.getString(_adsInHouse) ?? "";
  }

  set adsInHouse(String value) {
    _prefs?.setString(_adsInHouse, value);
  }

  // AdsObject? get adsInHouseObject {
  //   final jsonString = adsInHouse;
  //   if (jsonString.isEmpty) return null;
  //
  //   try {
  //     Map object = jsonDecode(jsonString);
  //     var adsObject = AdsObject.fromJson(object.cast());
  //     return adsObject;
  //   } on FormatException {
  //     return null;
  //   }
  // }

  // ----------------------- adsShowTop1
  final _adsShowTop1 = "ads_show_top_1";

  int get adsShowTop1 {
    return _prefs?.getInt(_adsShowTop1) ?? 0;
  }

  set adsShowTop1(int value) {
    _prefs?.setInt(_adsShowTop1, value);
  }

  // ----------------------- isSoundEffect
  final _isSoundEffect = "is_sound_effect";

  get checkSoundEffect {
    return _prefs?.getBool(_isSoundEffect) ?? true;
  }

  set checkSoundEffect(value) {
    _prefs?.setBool(_isSoundEffect, value);
  }

  // ----------------------- isTitleQuestion
  final _isTitleQuestion = "is_title_question";

  get showTitleQuestion {
    return _prefs?.getBool(_isTitleQuestion) ?? true;
  }

  set showTitleQuestion(value) {
    _prefs?.setBool(_isTitleQuestion, value);
  }

  // ----------------------- fontSizeChange
  final _fontSizeChange = "font_size_change";

  int get fontSizeChange {
    final fontChange = _prefs?.getInt(_fontSizeChange) ?? 0;
    if (fontChange < -2) {
      fontSizeChange = -2;
      return -2;
    }
    return fontChange;
  }

  set fontSizeChange(int value) {
    _prefs?.setInt(_fontSizeChange, value);
  }

  // ----------------------- skuPrice
  final _skuPrice = "sku_price";

  double getSkuPrice(String sku, int sale) {
    return _prefs?.getDouble("${_skuPrice}_${sku}_$sale") ?? 0;
  }

  setSkuPrice(double price, String sku, int sale) {
    _prefs?.setDouble("${_skuPrice}_${sku}_$sale", price);
  }

  // ----------------------- currencySymbol
  final _currencySymbol = "currency_symbol";

  String get currencySymbol {
    return _prefs?.getString(_currencySymbol) ?? "";
  }

  set currencySymbol(String value) {
    _prefs?.setString(_currencySymbol, value);
  }

  // ----------------------- lastTimeClickAds
  final _lastTimeClickAds = "last_time_click_ads";

  int get lastTimeClickAds {
    return _prefs?.getInt(_lastTimeClickAds) ?? 0;
  }

  set lastTimeClickAds(int value) {
    _prefs?.setInt(_lastTimeClickAds, value);
  }

  // ----------------------- lastTimeShowAdsInter
  final _lastTimeShowAdsInter = "last_time_show_ads_inter";

  int get lastTimeShowAdsInter {
    return _prefs?.getInt(_lastTimeShowAdsInter) ?? 0;
  }

  set lastTimeShowAdsInter(int value) {
    _prefs?.setInt(_lastTimeShowAdsInter, value);
  }

  // ----------------------- tipFavorite
  final _tipFavorite = "tip_favorite";

  String get tipFavorite {
    return _prefs?.getString(_tipFavorite) ?? "";
  }

  setTipsFavorite(int id) {
    final tips = tipFavorite;
    if (tips.contains("($id)")) {
      _prefs?.setString(_tipFavorite, tips.replaceAll("($id)", ""));
    } else {
      _prefs?.setString(_tipFavorite, "$tips($id)");
    }
  }

  // ----------------------- didOpenPremium
  final _didOpenPremium = "did_open_premium";

  bool get didOpenPremium {
    return _prefs?.getBool(_didOpenPremium) ?? false;
  }

  set didOpenPremium(bool value) {
    _prefs?.setBool(_didOpenPremium, value);
  }

  // ----------------------- timeStartSaleLocal
  final _timeStartSaleLocal = "time_start_sale_local";

  int get timeStartSaleLocal {
    return _prefs?.getInt(_timeStartSaleLocal) ?? 0;
  }

  set timeStartSaleLocal(int value) {
    _prefs?.setInt(_timeStartSaleLocal, value);
  }

  // ----------------------- timeSaleBadge
  final _timeSaleBadge = "time_sale_badge";

  int get timeSaleBadge {
    return _prefs?.getInt(_timeSaleBadge) ?? 0;
  }

  set timeSaleBadge(int value) {
    _prefs?.setInt(_timeSaleBadge, value);
  }

  // ----------------------- timeStartSaleLocal
  final _timeStartSaleNewUser = "time_start_sale_new_user";

  int get timeStartSaleNewUser {
    return _prefs?.getInt(_timeStartSaleNewUser) ?? 0;
  }

  set timeStartSaleNewUser(int value) {
    _prefs?.setInt(_timeStartSaleNewUser, value);
  }

  // ----------------------- showRate
  final _showRate = "show_rate";

  int get showDialogRate {
    return _prefs?.getInt(_showRate) ?? 0;
  }

  set showDialogRate(int value) {
    _prefs?.setInt(_showRate, value);
  }

  // ----------------------- numberOpenApp
  final _numberOpenApp = "number_open_app";

  int get numberOpenApp {
    return _prefs?.getInt(_numberOpenApp) ?? 0;
  }

  set numberOpenApp(int value) {
    _prefs?.setInt(_numberOpenApp, value);
  }

  // ----------------------- numberLoadLesson
  final _numberLoadLesson = "number_load_lesson";

  int get numberLoadLesson {
    return (_prefs?.getInt(_numberLoadLesson) ?? 0) % 5;
  }

  set numberLoadLesson(int value) {
    _prefs?.setInt(_numberLoadLesson, value);
  }

  // ----------------------- numberIntervalAds
  final _numberIntervalAds = "number_interval_ads";

  int get numberIntervalAds {
    return (_prefs?.getInt(_numberIntervalAds) ?? 0) % 10;
  }

  set numberIntervalAds(int value) {
    _prefs?.setInt(_numberIntervalAds, value);
  }

  // ----------------------- versionStore
  final _versionStore = "version_store";

  String get versionStore {
    return _prefs?.getString(_versionStore) ?? "";
  }

  set versionStore(String value) {
    _prefs?.setString(_versionStore, value);
  }

  // ----------------------- activeRatePre
  final _activeRatePre = "is_title_question";

  get activeRatePre {
    return _prefs?.getBool(_activeRatePre) ?? false;
  }

  set activeRatePre(value) {
    _prefs?.setBool(_activeRatePre, value);
  }

  // ----------------------- upgradePremiumRate
  final _upgradePremiumRate = "upgrade_premium_rate";

  get upgradePremiumRate {
    return _prefs?.getBool(_upgradePremiumRate) ?? false;
  }

  set upgradePremiumRate(value) {
    _prefs?.setBool(_upgradePremiumRate, value);
  }

  // --------------------- option display flashcard
  final _optionDisplayFlashcard = "option_display_flashcard";

  get displayOption {
    return _prefs?.getInt(_optionDisplayFlashcard) ?? 0;
  }

  set displayOption(value) {
    _prefs?.setInt(_optionDisplayFlashcard, value);
  }
}
