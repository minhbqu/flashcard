// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// // import 'package:heyfrance/model/country_json_object.dart';
// // import 'package:heyfrance/model/lesson/lesson_json_object.dart';
// // import 'package:heyfrance/model/theory/theory_grammar_json_object.dart';
// // import 'package:heyfrance/model/time_server_json_object.dart';
// // import 'package:heyfrance/model/user/verified_json_object.dart';
// // import 'package:heyfrance/model/version_unit_json_object.dart';
// // import 'package:heyfrance/viewmodel/helper/global_helper.dart';
// // import 'package:heyfrance/viewmodel/helper/preference_helper.dart';
//
// // import '../../../model/lesson/lesson_list_json_object.dart';
// // import '../../../model/lesson/status_lesson_json_object.dart';
// // import '../../../model/message_json_object.dart';
// // import '../../../model/test_out/ids_object.dart';
// // import '../../../model/test_out/test_out_json_object.dart';
// import '../../../model/theory/theory_word_json_object.dart';
// // import '../../../model/user/ads_in_house_json_object.dart';
// // import '../../../model/user/ads_in_house_message_json_object.dart';
// // import '../../../model/user/device_manager_json_object.dart';
// // import '../../../model/user/info_subscriptions_json_object.dart';
// // import '../../../model/user/sync_trial_json_object.dart';
// // import '../../../model/user/user_level_json_object.dart';
// // import '../../../model/user/user_profile_json_object.dart';
// import 'package:collection/collection.dart';
//
// late DioHelper dioHelper;
//
// class DioHelper {
//   late Dio _dio;
//   late CancelToken _cancelToken;
//
//   DioHelper() {
//     _dio = Dio();
//     _dio.options.connectTimeout = const Duration(seconds: 5);
//     _dio.options.receiveTimeout = const Duration(seconds: 5);
//     _cancelToken = CancelToken();
//   }
//
//   Future<String> getCountryCode() async {
//     final response =
//         await _dio.get("http://ip-api.com/json", cancelToken: _cancelToken);
//     var object = CountryJSONObject.fromJson(response.data);
//     return object.countryCode?.toLowerCase() ?? "";
//   }
//
//   Future<int> getTimeServer() async {
//     try {
//       final response = await _dio.get(GlobalHelper.urlGetTimeServer,
//           cancelToken: _cancelToken);
//       var object = TimeServerJSONObject.fromJson(response.data);
//       return object.version?.time ?? 0;
//     } on DioError {
//       return 0;
//     } on TypeError {
//       return 0;
//     }
//   }
//
//   Future<int> getVersion(String languageApp) async {
//     try {
//       Map<String, dynamic> params = <String, dynamic>{};
//       params["language"] = languageApp;
//
//       var token = preferenceHelper.userProfile?.user?.accessToken ?? "";
//       if (token.isNotEmpty) params["access_token"] = token;
//
//       final response = await _dio.get(GlobalHelper.urlGetVersionUnit,
//           queryParameters: params, cancelToken: _cancelToken);
//       var object = VersionUnitJSONObject.fromJson(response.data);
//       return object.version?.firstOrNull?.version ?? 0;
//     } on DioError {
//       return 0;
//     } on TypeError {
//       return 0;
//     }
//   }
//
//   Future<LessonListJSONObject?> getDataUnit(String languageApp) async {
//     try {
//       Map<String, dynamic> params = <String, dynamic>{};
//       params["language"] = languageApp;
//
//       var token = preferenceHelper.userProfile?.user?.accessToken ?? "";
//       if (token.isNotEmpty) params["access_token"] = token;
//
//       final response = await _dio.get(GlobalHelper.urlGetListUnit,
//           queryParameters: params, cancelToken: _cancelToken);
//       var object = LessonListJSONObject.fromJson(response.data);
//       return object;
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<LessonJSONObject?> getLesson(String id) async {
//     try {
//       Map<String, dynamic> params = <String, dynamic>{};
//       params["id"] = id;
//       var token = preferenceHelper.userProfile?.user?.accessToken ?? "";
//       if (token.isNotEmpty) params["access_token"] = token;
//
//       final response = await _dio.get(GlobalHelper.urlGetLesson,
//           queryParameters: params, cancelToken: _cancelToken);
//       var object = LessonJSONObject.fromJson(response.data);
//       return object;
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<AdsInHouseJSONObject?> getAdsInHouse(
//       String countryCode, String languageApp) async {
//     try {
//       final response = await _dio.get(GlobalHelper.urlAdsInHouse,
//           queryParameters: {
//             'country': countryCode,
//             'language': languageApp,
//             'platform': Platform.isAndroid ? "android" : "ios",
//             'project_id': 25
//           },
//           cancelToken: _cancelToken);
//       return AdsInHouseJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<AdsInHouseMessageJSONObject?> postAdsInHouseAction(int idUser,
//       int adGroupId, int adId, int bannerId, int click, String name) async {
//     try {
//       final response = await _dio.post(GlobalHelper.urlAdsInHouseAction,
//           data: {
//             'user_id': idUser,
//             'ad_group_id': adGroupId,
//             'ad_id': adId,
//             'banner_id': bannerId,
//             'click': click,
//             'name': name,
//             'platforms': Platform.isIOS ? "ios" : "android"
//           },
//           cancelToken: _cancelToken);
//       return AdsInHouseMessageJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<UserProfileJSONObject?> postRegisterEmail(
//       String name,
//       String email,
//       String password,
//       int dayOfBirth,
//       int monthOfBirth,
//       int yearOfBirth) async {
//     try {
//       Map<String, dynamic> params = <String, dynamic>{};
//       params["name"] = name;
//       params["email"] = email;
//       params["password"] = password;
//
//       if (dayOfBirth != 0 && monthOfBirth != 0 && yearOfBirth != 0) {
//         params["day_of_birth"] = dayOfBirth;
//         params["month_of_birth"] = monthOfBirth;
//         params["year_of_birth"] = yearOfBirth;
//       }
//
//       final response = await _dio.post(GlobalHelper.urlRegisterEmail,
//           data: params, cancelToken: _cancelToken);
//       return UserProfileJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<UserProfileJSONObject?> postLoginEmail(
//       String email, String password) async {
//     try {
//       final response = await _dio.post(GlobalHelper.urlSignInEmail,
//           data: {'email': email, 'password': password},
//           cancelToken: _cancelToken);
//       return UserProfileJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<UserProfileJSONObject?> postLoginGoogle(String accessToken) async {
//     try {
//       final response = await _dio.post(GlobalHelper.urlSignInGoogle,
//           data: {
//             'accessToken': accessToken,
//             'platform': Platform.isAndroid ? "android" : "ios"
//           },
//           cancelToken: _cancelToken);
//       return UserProfileJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<UserProfileJSONObject?> postLoginApple(
//       String accessToken, String name) async {
//     try {
//       final response = await _dio.post(GlobalHelper.urlSignInApple,
//           data: {'accessToken': accessToken, 'name': name},
//           cancelToken: _cancelToken);
//       return UserProfileJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<DeviceManagerJSONObject?> getDeviceManager(String accessToken) async {
//     try {
//       Map<String, dynamic> params = <String, dynamic>{};
//       params["access_token"] = accessToken;
//
//       final response = await _dio.get(GlobalHelper.urlGetDeviceManager,
//           queryParameters: params, cancelToken: _cancelToken);
//       return DeviceManagerJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<bool> updateDeviceManager(
//       String idDevice,
//       String device,
//       String platforms,
//       String platformsVersion,
//       String appVersion,
//       String accessToken) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["device_id"] = idDevice;
//     params["device"] = device;
//     params["platforms"] = platforms;
//     params["platforms_version"] = platformsVersion;
//     params["app_version"] = appVersion;
//
//     try {
//       final response = await _dio.post(
//           "${GlobalHelper.urlUpdateDeviceManager}?access_token=$accessToken",
//           data: params,
//           cancelToken: _cancelToken);
//       final str = response.data.toString();
//       return str.contains("Success");
//     } on DioError {
//       return false;
//     } on TypeError {
//       return false;
//     }
//   }
//
//   Future<bool> deleteDeviceManager(String idDevice, String accessToken) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["device_id"] = idDevice;
//
//     try {
//       final response = await _dio.post(
//           "${GlobalHelper.urlDeleteDeviceManager}?access_token=$accessToken",
//           data: params,
//           cancelToken: _cancelToken);
//       final str = response.data.toString();
//       return str.contains("Success");
//     } on DioError {
//       return false;
//     } on TypeError {
//       return false;
//     }
//   }
//
//   Future<StatusLessonJSONObject?> getUserStatusLesson() async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["access_token"] = preferenceHelper.accessToken;
//
//     try {
//       final response = await _dio.get(GlobalHelper.urlGetStatusLesson,
//           queryParameters: params, cancelToken: _cancelToken);
//       return StatusLessonJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<MessageJSONObject?> postUpdateStatusLesson(Map<String, int> statusList,
//       {String accessToken = ""}) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["status"] = statusList;
//     try {
//       final response = await _dio.post(
//           "${GlobalHelper.urlUpdateStatusLesson}?access_token=${accessToken.isNotEmpty ? accessToken : preferenceHelper.accessToken}",
//           data: params,
//           cancelToken: _cancelToken);
//       return MessageJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<bool> postReportSentence(
//       String keyId,
//       String lessonId,
//       int unitId,
//       int questionId,
//       String language,
//       String content,
//       int lessonVersion,
//       String appVersion,
//       String platforms,
//       int userId) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["key_id"] = keyId;
//     params["lesson_id"] = lessonId;
//     params["unit_id"] = unitId;
//     params["question_id"] = questionId;
//     params["language"] = language;
//     params["content"] = content;
//     params["lesson_version"] = lessonVersion;
//     params["app_version"] = appVersion;
//     params["platforms"] = platforms;
//     params["user_id"] = userId;
//
//     try {
//       await _dio.post(GlobalHelper.urlSendReport,
//           data: params, cancelToken: _cancelToken);
//       return true;
//     } on DioError {
//       return false;
//     } on TypeError {
//       return false;
//     }
//   }
//
//   Future<TestOutJSONObject?> getTestIds(List<String> ids) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["ids"] = jsonEncode(IdsObject(ids));
//
//     final accessToken = preferenceHelper.accessToken;
//     if (accessToken.isNotEmpty) params["access_token"] = accessToken;
//
//     try {
//       final response = await _dio.get(GlobalHelper.urlGetTestIds,
//           queryParameters: params, cancelToken: _cancelToken);
//       return TestOutJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<UserProfileJSONObject?> getPremiumUser() async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["access_token"] = preferenceHelper.accessToken;
//
//     try {
//       final response = await _dio.get(GlobalHelper.urlGetPremium,
//           queryParameters: params, cancelToken: _cancelToken);
//       return UserProfileJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<UserLevelJSONObject?> getUserLevel() async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["access_token"] = preferenceHelper.accessToken;
//
//     try {
//       final response = await _dio.get(GlobalHelper.urlGetUserLevel,
//           queryParameters: params, cancelToken: _cancelToken);
//       return UserLevelJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<MessageJSONObject?> postUpdateUserLevel(Map<String, String> levelList,
//       {String accessToken = ""}) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["level"] = levelList;
//     try {
//       final response = await _dio.post(
//           "${GlobalHelper.urlUpdateUserLevel}?access_token=${accessToken.isNotEmpty ? accessToken : preferenceHelper.accessToken}",
//           data: params,
//           cancelToken: _cancelToken);
//       return MessageJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<MessageJSONObject?> postUpdateProcessDaily(String date, int exp,
//       {String accessToken = ""}) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["date"] = date;
//     params["exp"] = exp;
//     try {
//       final response = await _dio.post(
//           "${GlobalHelper.urlUpdateProcessDaily}?access_token=${accessToken.isNotEmpty ? accessToken : preferenceHelper.accessToken}",
//           data: params,
//           cancelToken: _cancelToken);
//       return MessageJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<MessageJSONObject?> deleteAccount() async {
//     try {
//       final response = await _dio.post(
//           "${GlobalHelper.urlDeleteAccount}?access_token=${preferenceHelper.accessToken}",
//           data: null,
//           cancelToken: _cancelToken);
//       return MessageJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<TheoryWordJSONObject?> getTheoryWordData(String lessonId) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["lesson_id"] = lessonId;
//     params["type"] = "word";
//
//     final accessToken = preferenceHelper.accessToken;
//     if (accessToken.isNotEmpty) params["access_token"] = accessToken;
//
//     try {
//       final response = await _dio.get(GlobalHelper.urlGetTheory,
//           queryParameters: params, cancelToken: _cancelToken);
//       return TheoryWordJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<TheoryGrammarJSONObject?> getTheoryGrammarData(String lessonId) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["lesson_id"] = lessonId;
//     params["type"] = "grammar";
//
//     final accessToken = preferenceHelper.accessToken;
//     if (accessToken.isNotEmpty) params["access_token"] = accessToken;
//
//     try {
//       final response = await _dio.get(GlobalHelper.urlGetTheory,
//           queryParameters: params, cancelToken: _cancelToken);
//       return TheoryGrammarJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<int> getInfoPurchased(
//       String productID, String receiptString, int transactionDate) async {
//     if (productID.contains(GlobalHelper.skuLifetime)) {
//       return transactionDate ~/ 1000 + 60 * 60 * 24 * 365 * 5;
//     }
//
//     Map<String, dynamic> params = <String, dynamic>{};
//     if (Platform.isAndroid) {
//       params["subscriptionId"] = productID;
//       params["token"] = receiptString;
//     } else if (Platform.isIOS) {
//       params["receipt"] = receiptString;
//       if (kDebugMode) params["type"] = "sandbox";
//     }
//
//     try {
//       final response = await _dio.post(
//           Platform.isAndroid
//               ? GlobalHelper.urlInfoSubscriptionsGoogle
//               : GlobalHelper.urlInfoSubscriptionsApple,
//           data: params,
//           cancelToken: _cancelToken);
//       final inforObject = InfoSubscriptionsJSONObject.fromJson(response.data);
//       return (inforObject.verified?.timeExpired ?? 0) ~/ 1000;
//     } on DioError {
//       return 0;
//     } on TypeError {
//       return 0;
//     }
//   }
//
//   Future<VerifiedJSONObject?> syncPremiumAccount(
//       String productID, String receiptString) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     if (Platform.isAndroid) {
//       params["subscriptionId"] = productID;
//       params["token"] = receiptString;
//     } else if (Platform.isIOS) {
//       params["receipt"] = receiptString;
//       if (kDebugMode) params["type"] = "sandbox";
//     }
//
//     try {
//       final response = await _dio.post(
//           "${Platform.isAndroid ? GlobalHelper.urlVerifiedGoogleStore : GlobalHelper.urlVerifiedAppleStore}?access_token=${preferenceHelper.accessToken}",
//           data: params,
//           cancelToken: _cancelToken);
//       return VerifiedJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   Future<SyncTrialJSONObject?> syncPremiumTrial(int days) async {
//     Map<String, dynamic> params = <String, dynamic>{};
//     params["platforms"] = Platform.operatingSystem;
//     params["days"] = days;
//
//     try {
//       final response = await _dio.post(
//           "${GlobalHelper.urlPremiumTrial}?access_token=${preferenceHelper.accessToken}",
//           data: params,
//           cancelToken: _cancelToken);
//       return SyncTrialJSONObject.fromJson(response.data);
//     } on DioError {
//       return null;
//     } on TypeError {
//       return null;
//     }
//   }
//
//   close() {
//     _cancelToken.cancel();
//     _dio.close();
//   }
// }
