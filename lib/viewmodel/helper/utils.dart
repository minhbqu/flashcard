import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_archive/flutter_archive.dart';
// import 'package:heyfrance/viewmodel/extensions/string_ext.dart';
// import 'package:heyfrance/viewmodel/helper/dio/dio_helper.dart';
// import 'package:heyfrance/viewmodel/helper/global_helper.dart';
// import 'package:heyfrance/viewmodel/helper/preference_helper.dart';
// import 'package:heyfrance/viewmodel/helper/screen_info.dart';
// import 'package:in_app_review/in_app_review.dart';
// import 'package:intl/intl.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../model/url_data_object.dart';
// import '../../model/user/trophy_json_object.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

class Utils {
  static String getLanguageName(String languageCode) {
    switch (languageCode) {
      case "vi":
        return "Tiếng Việt";
      case "en":
        return "English";
    }
    return "";
  }

  // static Future openLink(String link) async {
  //   final url = Uri.parse(link);
  //   if (await canLaunchUrl(url)) {
  //     launchUrl(url);
  //   }
  // }

  // static Future<bool> isInternetAvailable() async {
  //   final bool isConnected = await InternetConnectionChecker().hasConnection;
  //   return isConnected;
  // }

  // static Future<String> getFilePath(uniqueFileName) async {
  //   String path = '';
  //   Directory dir = await getApplicationDocumentsDirectory();
  //   path = '${dir.path}/$uniqueFileName';
  //   return path;
  // }

  // static Future<bool> unzipFile(String atPath, String toDestination,
  //     Function(int progress) onExtracting) async {
  //   final zipFile = File(atPath);
  //
  //   Directory dir = await getApplicationDocumentsDirectory();
  //   final destinationDir = Directory("${dir.path}/$toDestination");
  //   try {
  //     await ZipFile.extractToDirectory(
  //         zipFile: zipFile,
  //         destinationDir: destinationDir,
  //         onExtracting: (zipEntry, progress) {
  //           if (zipEntry.isDirectory) return ZipFileOperation.includeItem;
  //           onExtracting(progress.round());
  //
  //           final file = File("${destinationDir.path}/${zipEntry.name}");
  //           if (file.existsSync()) return ZipFileOperation.skipItem;
  //           return ZipFileOperation.includeItem;
  //         });
  //     return true;
  //   } on PlatformException {
  //     return false;
  //   }
  // }

  static int convertDayOfWeek(String dayOfWeek) {
    switch (dayOfWeek.toLowerCase()) {
      case "mon":
        return 2;
      case "tue":
        return 3;
      case "wed":
        return 4;
      case "thu":
        return 5;
      case "fri":
        return 6;
      case "sat":
        return 7;
      case "sun":
        return 8;
      default:
        return 0;
    }
  }

  // static String getTrophyTitle(
  //     AppLocalizations appLocalized, int id, bool isTitle) {
  //   switch (id) {
  //     case TrophyJSONObject.tanBinh:
  //       return isTitle ? appLocalized.tan_binh : appLocalized.tan_binh_content;
  //     case TrophyJSONObject.binhNhat:
  //       return isTitle
  //           ? appLocalized.binh_nhat
  //           : appLocalized.binh_nhat_content;
  //     case TrophyJSONObject.thuongSi:
  //       return isTitle
  //           ? appLocalized.thuong_si
  //           : appLocalized.thuong_si_content;
  //     case TrophyJSONObject.daiUy:
  //       return isTitle ? appLocalized.dai_uy : appLocalized.dai_uy_content;
  //     case TrophyJSONObject.daiTa:
  //       return isTitle ? appLocalized.dai_ta : appLocalized.dai_ta_content;
  //     case TrophyJSONObject.daiTuong:
  //       return isTitle
  //           ? appLocalized.dai_tuong
  //           : appLocalized.dai_tuong_content;
  //
  //     case TrophyJSONObject.cunCon:
  //       return isTitle ? appLocalized.cun_con : appLocalized.cun_con_content;
  //     case TrophyJSONObject.cunDayThi:
  //       return isTitle
  //           ? appLocalized.cun_day_thi
  //           : appLocalized.cun_day_thi_content;
  //     case TrophyJSONObject.cunTruongThanh:
  //       return isTitle
  //           ? appLocalized.cun_truong_thanh
  //           : appLocalized.cun_truong_thanh_content;
  //     case TrophyJSONObject.cunDauDan:
  //       return isTitle
  //           ? appLocalized.cun_dau_dan
  //           : appLocalized.cun_dau_dan_content;
  //     case TrophyJSONObject.cunGiaLang:
  //       return isTitle
  //           ? appLocalized.cun_gia_lang
  //           : appLocalized.cun_gia_lang_content;
  //
  //     case TrophyJSONObject.khucXuongBac:
  //       return isTitle
  //           ? appLocalized.khuc_xuong_bac
  //           : appLocalized.khuc_xuong_bac_content;
  //     case TrophyJSONObject.khucXuongVang:
  //       return isTitle
  //           ? appLocalized.khuc_xuong_vang
  //           : appLocalized.khuc_xuong_vang_content;
  //     case TrophyJSONObject.chiecBungDoi:
  //       return isTitle
  //           ? appLocalized.chiec_bung_doi
  //           : appLocalized.chiec_bung_doi_content;
  //     case TrophyJSONObject.cunThangThien:
  //       return isTitle
  //           ? appLocalized.cun_thang_thien
  //           : appLocalized.cun_thang_thien_content;
  //
  //     case TrophyJSONObject.cunChamChi:
  //       return isTitle
  //           ? appLocalized.cun_cham_chi
  //           : appLocalized.cun_cham_chi_content;
  //     case TrophyJSONObject.thanhDiemDanh:
  //       return isTitle
  //           ? appLocalized.thanh_diem_danh
  //           : appLocalized.thanh_diem_danh_content;
  //     case TrophyJSONObject.cunGuongMau:
  //       return isTitle
  //           ? appLocalized.cun_guong_mau
  //           : appLocalized.cun_guong_mau_content;
  //     case TrophyJSONObject.cunRatRanh:
  //       return isTitle
  //           ? appLocalized.cun_rat_ranh
  //           : appLocalized.cun_rat_ranh_content;
  //
  //     case TrophyJSONObject.voSachChuDep:
  //       return isTitle
  //           ? appLocalized.vo_sach_chu_dep
  //           : appLocalized.vo_sach_chu_dep_content;
  //     case TrophyJSONObject.cunNhaHangXom:
  //       return isTitle
  //           ? appLocalized.cun_nha_hang_xom
  //           : appLocalized.cun_nha_hang_xom_content;
  //     case TrophyJSONObject.cunNhaNguoiTa:
  //       return isTitle
  //           ? appLocalized.cun_nha_nguoi_ta
  //           : appLocalized.cun_nha_nguoi_ta_content;
  //     case TrophyJSONObject.cunNhaMinh:
  //       return isTitle
  //           ? appLocalized.cun_nha_minh
  //           : appLocalized.cun_nha_minh_content;
  //
  //     case TrophyJSONObject.vuotCap:
  //       return isTitle ? appLocalized.vuot_cap : appLocalized.vuot_cap_content;
  //     case TrophyJSONObject.chuyenGiaVuotCap:
  //       return isTitle
  //           ? appLocalized.chuyen_gia_vuot_cap
  //           : appLocalized.chuyen_gia_vuot_cap_content;
  //
  //     case TrophyJSONObject.cunTapNoi:
  //       return isTitle
  //           ? appLocalized.cun_tap_noi
  //           : appLocalized.cun_tap_noi_content;
  //     case TrophyJSONObject.cunMeNoi:
  //       return isTitle
  //           ? appLocalized.cun_me_noi
  //           : appLocalized.cun_me_noi_content;
  //     case TrophyJSONObject.cunBaTam:
  //       return isTitle
  //           ? appLocalized.cun_ba_tam
  //           : appLocalized.cun_ba_tam_content;
  //     case TrophyJSONObject.loaPhuong:
  //       return isTitle
  //           ? appLocalized.loa_phuong
  //           : appLocalized.loa_phuong_content;
  //     case TrophyJSONObject.thongTanXa:
  //       return isTitle
  //           ? appLocalized.thong_tan_xa
  //           : appLocalized.thong_tan_xa_content;
  //
  //     case TrophyJSONObject.beCanThan:
  //       return isTitle
  //           ? appLocalized.be_can_than
  //           : appLocalized.be_can_than_content;
  //     case TrophyJSONObject.anhCanThan:
  //       return isTitle
  //           ? appLocalized.anh_can_than
  //           : appLocalized.anh_can_than_content;
  //     case TrophyJSONObject.ongCanThan:
  //       return isTitle
  //           ? appLocalized.ong_can_than
  //           : appLocalized.ong_can_than_content;
  //
  //     case TrophyJSONObject.cunCayCuoc:
  //       return isTitle
  //           ? appLocalized.cun_cay_cuoc
  //           : appLocalized.cun_cay_cuoc_content;
  //     case TrophyJSONObject.sieuNangLuc:
  //       return isTitle
  //           ? appLocalized.sieu_nang_luc
  //           : appLocalized.sieu_nang_luc_content;
  //     case TrophyJSONObject.theHulk:
  //       return isTitle ? appLocalized.the_hulk : appLocalized.the_hulk_content;
  //
  //     case TrophyJSONObject.maTocDo:
  //       return isTitle
  //           ? appLocalized.ma_toc_do
  //           : appLocalized.ma_toc_do_content;
  //     case TrophyJSONObject.theFlash:
  //       return isTitle
  //           ? appLocalized.the_flash
  //           : appLocalized.the_flash_content;
  //     case TrophyJSONObject.tiaChopDen:
  //       return isTitle
  //           ? appLocalized.tia_chop_den
  //           : appLocalized.tia_chop_den_content;
  //
  //     case TrophyJSONObject.nhaSuuTam:
  //       return isTitle
  //           ? appLocalized.nha_suu_tam
  //           : appLocalized.nha_suu_tam_content;
  //     case TrophyJSONObject.thoSan:
  //       return isTitle ? appLocalized.tho_san : appLocalized.tho_san_content;
  //     case TrophyJSONObject.vuaDanhHieu:
  //       return isTitle
  //           ? appLocalized.vua_danh_hieu
  //           : appLocalized.vua_danh_hieu_content;
  //
  //     case TrophyJSONObject.premium:
  //       return isTitle
  //           ? appLocalized.premium_trophy
  //           : appLocalized.premium_trophy_content;
  //     case TrophyJSONObject.nguoiGioiThieu:
  //       return isTitle
  //           ? appLocalized.nguoi_gioi_thieu
  //           : appLocalized.nguoi_gioi_thieu_content;
  //     case TrophyJSONObject.fiveStar:
  //       return isTitle
  //           ? appLocalized.rate_5_star
  //           : appLocalized.rate_5_star_content;
  //
  //     default:
  //       return "";
  //   }
  // }

  // static String getTrophyImage(int id) {
  //   switch (id) {
  //     case TrophyJSONObject.tanBinh:
  //       return "ic_level_tanbinh";
  //     case TrophyJSONObject.binhNhat:
  //       return "ic_level_binhnhat";
  //     case TrophyJSONObject.thuongSi:
  //       return "ic_level_thuongsi";
  //     case TrophyJSONObject.daiUy:
  //       return "ic_level_daiuy";
  //     case TrophyJSONObject.daiTa:
  //       return "ic_level_daita";
  //     case TrophyJSONObject.daiTuong:
  //       return "ic_level_daituong";
  //
  //     case TrophyJSONObject.cunCon:
  //       return "ic_trophy_cuncon";
  //     case TrophyJSONObject.cunDayThi:
  //       return "ic_trophy_cundaythi";
  //     case TrophyJSONObject.cunTruongThanh:
  //       return "ic_trophy_cuntruongthanh";
  //     case TrophyJSONObject.cunDauDan:
  //       return "ic_trophy_cundaudan";
  //     case TrophyJSONObject.cunGiaLang:
  //       return "ic_trophy_cungialang";
  //
  //     case TrophyJSONObject.khucXuongBac:
  //       return "ic_trophy_khucxuongbac";
  //     case TrophyJSONObject.khucXuongVang:
  //       return "ic_trophy_khucxuongvang";
  //     case TrophyJSONObject.chiecBungDoi:
  //       return "ic_trophy_chiecbungdoi";
  //     case TrophyJSONObject.cunThangThien:
  //       return "ic_trophy_cunthangthien";
  //
  //     case TrophyJSONObject.cunChamChi:
  //       return "ic_trophy_cunchamchi";
  //     case TrophyJSONObject.thanhDiemDanh:
  //       return "ic_trophy_thanhdiemdanh";
  //     case TrophyJSONObject.cunGuongMau:
  //       return "ic_trophy_cunguongmau";
  //     case TrophyJSONObject.cunRatRanh:
  //       return "ic_trophy_cunratranh";
  //
  //     case TrophyJSONObject.voSachChuDep:
  //       return "ic_trophy_vosachchudep";
  //     case TrophyJSONObject.cunNhaHangXom:
  //       return "ic_trophy_cunnhahangxom";
  //     case TrophyJSONObject.cunNhaNguoiTa:
  //       return "ic_trophy_cunnhanguoita";
  //     case TrophyJSONObject.cunNhaMinh:
  //       return "ic_trophy_cunnhaminh";
  //     case TrophyJSONObject.vuotCap:
  //       return "ic_trophy_vuotcap";
  //     case TrophyJSONObject.chuyenGiaVuotCap:
  //       return "ic_trophy_chuyengiavuotcap";
  //     case TrophyJSONObject.cunTapNoi:
  //       return "ic_trophy_cuntapnoi";
  //     case TrophyJSONObject.cunMeNoi:
  //       return "ic_trophy_cunmenoi";
  //     case TrophyJSONObject.cunBaTam:
  //       return "ic_trophy_cunbatam";
  //     case TrophyJSONObject.loaPhuong:
  //       return "ic_trophy_loaphuong";
  //     case TrophyJSONObject.thongTanXa:
  //       return "ic_trophy_thongtanxa";
  //
  //     case TrophyJSONObject.beCanThan:
  //       return "ic_trophy_becanthan";
  //     case TrophyJSONObject.anhCanThan:
  //       return "ic_trophy_anhcanthan";
  //     case TrophyJSONObject.ongCanThan:
  //       return "ic_trophy_ongcanthan";
  //
  //     case TrophyJSONObject.cunCayCuoc:
  //       return "ic_trophy_cuncaycuoc";
  //     case TrophyJSONObject.sieuNangLuc:
  //       return "ic_trophy_cunsieunangluc";
  //     case TrophyJSONObject.theHulk:
  //       return "ic_trophy_thehulk";
  //
  //     case TrophyJSONObject.maTocDo:
  //       return "ic_trophy_matocdo";
  //     case TrophyJSONObject.theFlash:
  //       return "ic_trophy_theflash";
  //     case TrophyJSONObject.tiaChopDen:
  //       return "ic_trophy_black_lighting";
  //
  //     case TrophyJSONObject.nhaSuuTam:
  //       return "ic_trophy_nhasuutam";
  //     case TrophyJSONObject.thoSan:
  //       return "ic_trophy_thosan";
  //     case TrophyJSONObject.vuaDanhHieu:
  //       return "ic_trophy_vuadanhhieu";
  //
  //     case TrophyJSONObject.premium:
  //       return "ic_trophy_premium";
  //     case TrophyJSONObject.nguoiGioiThieu:
  //       return "ic_trophy_nguoigioithieu";
  //     case TrophyJSONObject.fiveStar:
  //       return "ic_trophy_rate_5_star";
  //
  //     default:
  //       return "";
  //   }
  // }
  //
  // static int getAppellationId(int exp) {
  //   if (exp < 100) {
  //     return 0;
  //   } else if (exp < 500) {
  //     return TrophyJSONObject.tanBinh;
  //   } else if (exp < 1000) {
  //     return TrophyJSONObject.binhNhat;
  //   } else if (exp < 2000) {
  //     return TrophyJSONObject.thuongSi;
  //   } else if (exp < 5000) {
  //     return TrophyJSONObject.daiUy;
  //   } else if (exp < 10000) {
  //     return TrophyJSONObject.daiTa;
  //   } else {
  //     return TrophyJSONObject.daiTuong;
  //   }
  // }
  //
  // static int getExpReach(int id) {
  //   switch (id) {
  //     case TrophyJSONObject.tanBinh:
  //       return 100;
  //     case TrophyJSONObject.binhNhat:
  //       return 500;
  //     case TrophyJSONObject.thuongSi:
  //       return 1000;
  //     case TrophyJSONObject.daiUy:
  //       return 2000;
  //     case TrophyJSONObject.daiTa:
  //       return 5000;
  //     case TrophyJSONObject.daiTuong:
  //       return 10000;
  //     default:
  //       return 0;
  //   }
  // }
  //
  // static int getProcessLevel(int exp, int div) {
  //   if (exp <= getExpReach(TrophyJSONObject.tanBinh)) {
  //     return div == 6 ? (exp ~/ div) : 0;
  //   } else if (exp <= getExpReach(TrophyJSONObject.binhNhat)) {
  //     return getProcessLevel(getExpReach(TrophyJSONObject.tanBinh), div) +
  //         (exp - getExpReach(TrophyJSONObject.tanBinh)) *
  //             100 ~/
  //             ((getExpReach(TrophyJSONObject.binhNhat) -
  //                     getExpReach(TrophyJSONObject.tanBinh)) *
  //                 div);
  //   } else if (exp <= getExpReach(TrophyJSONObject.thuongSi)) {
  //     return getProcessLevel(getExpReach(TrophyJSONObject.binhNhat), div) +
  //         (exp - getExpReach(TrophyJSONObject.binhNhat)) *
  //             100 ~/
  //             ((getExpReach(TrophyJSONObject.thuongSi) -
  //                     getExpReach(TrophyJSONObject.binhNhat)) *
  //                 div);
  //   } else if (exp <= getExpReach(TrophyJSONObject.daiUy)) {
  //     return getProcessLevel(getExpReach(TrophyJSONObject.thuongSi), div) +
  //         (exp - getExpReach(TrophyJSONObject.thuongSi)) *
  //             100 ~/
  //             ((getExpReach(TrophyJSONObject.daiUy) -
  //                     getExpReach(TrophyJSONObject.thuongSi)) *
  //                 div);
  //   } else if (exp <= getExpReach(TrophyJSONObject.daiTa)) {
  //     return getProcessLevel(getExpReach(TrophyJSONObject.thuongSi), div) +
  //         (exp - getExpReach(TrophyJSONObject.thuongSi)) *
  //             100 ~/
  //             ((getExpReach(TrophyJSONObject.daiTa) -
  //                     getExpReach(TrophyJSONObject.thuongSi)) *
  //                 div);
  //   } else if (exp <= getExpReach(TrophyJSONObject.daiTuong)) {
  //     return getProcessLevel(getExpReach(TrophyJSONObject.daiTa), div) +
  //         (exp - getExpReach(TrophyJSONObject.daiTa)) *
  //             100 ~/
  //             ((getExpReach(TrophyJSONObject.daiTuong) -
  //                     getExpReach(TrophyJSONObject.daiTa)) *
  //                 div);
  //   }
  //   return 100;
  // }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // static double widthScreen(BuildContext context) {
  //   return isPortrait(context)
  //       ? preferenceHelper.widthScreen
  //       : preferenceHelper.heightScreen;
  // }
  //
  // static double heightScreen(BuildContext context) {
  //   return isPortrait(context)
  //       ? preferenceHelper.heightScreen
  //       : preferenceHelper.widthScreen;
  // }

  // static bool isTablet() {
  //   return screenSize == ScreenSize.md ||
  //       screenSize == ScreenSize.lg ||
  //       screenSize == ScreenSize.xl;
  // }
  //
  // static int getTypeQuestion(String? kindDesc) {
  //   String kind = kindDesc?.clearSpace ?? "";
  //   if (kind.isEmpty) return 0;
  //
  //   if (kind == "đọc nghĩa và chọn ảnh - từ - phiên âm".clearSpace) return 1;
  //   if (kind == "nghe và chọn từ - phiên âm".clearSpace) return 2;
  //   if (kind == "đọc nghĩa và chọn từ - phiên âm".clearSpace) return 3;
  //   if (kind == "nghe - đọc nghĩa và chọn câu".clearSpace) return 4;
  //   if (kind == "nghe - đọc câu hỏi và chọn câu trả lời".clearSpace) return 5;
  //   if (kind == "nghe - đọc câu trả lời và chọn câu hỏi".clearSpace) return 6;
  //   if (kind == "nghe và chọn nghĩa".clearSpace) return 7;
  //   if (kind == "nghe - đọc câu và chọn nghĩa".clearSpace) return 8;
  //   if (kind == "nghe và ghép từ thành câu".clearSpace) return 9;
  //   if (kind == "nghe - đọc nghĩa và ghép từ thành câu".clearSpace) return 10;
  //   if (kind == "nghe - đọc câu hỏi và ghép câu trả lời".clearSpace) return 11;
  //   if (kind == "nghe - đọc câu trả lời và ghép câu hỏi".clearSpace) return 12;
  //   if (kind == "nghe - đọc câu và ghép nghĩa".clearSpace) return 13;
  //   if (kind == "nghe - đọc từ (câu) và nói lại".clearSpace) return 17;
  //   if (kind == "nghe và nói lại".clearSpace) return 18;
  //   if (kind == "đọc từ - phiên âm và chọn chỗ trống phù hợp".clearSpace) {
  //     return 21;
  //   }
  //   if (kind == "đọc câu - phiên âm và chọn từ điền vào chỗ trống".clearSpace) {
  //     return 22;
  //   }
  //   if (kind == "chọn hình phù hợp với đoạn ghi âm".clearSpace) return 23;
  //   if (kind == "đọc câu và bỏ từ hoặc cụm từ thừa".clearSpace) return 25;
  //   if (kind ==
  //       "đọc câu hỏi và ghép câu trả lời - đọc câu trả lời".clearSpace) {
  //     return 26;
  //   }
  //   if (kind == "đọc nghĩa - xem ảnh và đánh máy đáp án".clearSpace) return 32;
  //   if (kind == "đọc và nối từ với nghĩa".clearSpace) return 33;
  //
  //   return 0;
  // }
  //
  // static UrlDataObject convertUrlData(String id, String urlOrigin) {
  //   if (!urlOrigin.contains("assets")) return UrlDataObject(urlOrigin, false);
  //
  //   final startIndex = urlOrigin.indexOf("assets");
  //   if (startIndex == -1) return UrlDataObject(urlOrigin, false);
  //
  //   final urlSub = urlOrigin.substring(startIndex + 6);
  //
  //   final fileUrl =
  //       "${preferenceHelper.documentsPath}/${GlobalHelper.keyDBName}$id$urlSub";
  //
  //   if (File(fileUrl).existsSync()) return UrlDataObject(fileUrl, true);
  //   return UrlDataObject(urlOrigin, false);
  // }
  //
  // static Future playAudio(String url,
  //     {double speed = 1.0,
  //     VoidCallback? readyListener,
  //     VoidCallback? completeListener}) async {
  //   final player = AudioPlayer();
  //   await player.setUrl(url);
  //   if (completeListener != null || readyListener != null) {
  //     player.playerStateStream.listen((event) {
  //       switch (event.processingState) {
  //         case ProcessingState.ready:
  //           if (readyListener != null) readyListener();
  //           break;
  //         case ProcessingState.completed:
  //           if (completeListener != null) completeListener();
  //           break;
  //         default:
  //           break;
  //       }
  //     });
  //   }
  //   await player.setSpeed(speed);
  //   await player.play();
  //   await player.stop();
  // }
  //
  // static Future playSound(String soundName, String soundExtension,
  //     {double volume = 1.0}) async {
  //   final player = AudioPlayer();
  //   await player.setVolume(volume);
  //   await player.setUrl('asset:///assets/sound/$soundName.$soundExtension');
  //   await player.play();
  //   await player.stop();
  // }
  //
  // static Future trackerScreen(String category) async {
  //   await FirebaseAnalytics.instance.setCurrentScreen(screenName: category);
  // }
  //
  // static Future trackerEvent(String category, String action) async {
  //   await FirebaseAnalytics.instance.logEvent(
  //     name: category,
  //     parameters: {
  //       "event": action,
  //     },
  //   );
  // }
  //
  // static Future trackBannerEvent(String action) async {
  //   await FirebaseAnalytics.instance.logEvent(
  //     name: "AdsInHouse",
  //     parameters: {
  //       "event": action,
  //     },
  //   );
  // }
  //
  // static trackAdsInHouseEvent(int idUser, int adGroupId, int adId, int bannerId,
  //     int click, String name) {
  //   dioHelper
  //       .postAdsInHouseAction(idUser, adGroupId, adId, bannerId, click, name)
  //       .then((messageObject) => null);
  // }
  //
  // static trackTiktokEvent(String event) async {
  //   const platform = MethodChannel("com.eup.heyfrance/tiktok");
  //   await platform.invokeMethod("tiktok_track", {"event": event});
  // }
  //
  // static String getFormatDate(String languageText, String? sqlDate) {
  //   if (sqlDate == null || sqlDate.isEmpty) return "";
  //   DateTime date = DateFormat("dd-MM-yyyy").parse(sqlDate);
  //   return DateFormat("dd-MM-yyyy", languageText).format(date);
  // }
  //
  // static loadJSONAsset(String fileName, Function(String data) assetCallback) {
  //   rootBundle
  //       .loadString("assets/json/$fileName")
  //       .then((value) => assetCallback(value));
  // }
  //
  // static rateApp(VoidCallback completeListener,
  //     {bool isRatePre = false}) async {
  //   final InAppReview inAppReview = InAppReview.instance;
  //   if (Platform.isAndroid) {
  //     inAppReview.openStoreListing();
  //   } else {
  //     if (isRatePre) {
  //       inAppReview.openStoreListing(appStoreId: "6447281227");
  //     } else {
  //       if (await inAppReview.isAvailable()) {
  //         inAppReview.requestReview();
  //       } else {
  //         inAppReview.openStoreListing(appStoreId: "6447281227");
  //       }
  //     }
  //   }
  //   completeListener();
  // }
}
