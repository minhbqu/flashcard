
import 'dart:async';

late StreamController<String> streamController;

class EventHelper {
  static const onStatusLessonUpdate = "on_status_lesson_update";
  static const onUserLevelSync = "on_user_level_sync";
  static const onLoginSync = "on_login_sync";
  static const onLoadAdMod = "on_load_admod";
  static const onShowIntervalAds = "on_show_interval_ads";
  static const onUpgradeAdsDialog = "on_upgrade_ads_dialog";

  push(String event) {
    streamController.sink.add(event);
  }

  StreamSubscription? _subscription;
  listen(Function(String) eventListener) {
    _subscription = streamController.stream.listen((event) {
      eventListener(event);
    });
  }

  cancel() {
    _subscription?.cancel();
  }
}
