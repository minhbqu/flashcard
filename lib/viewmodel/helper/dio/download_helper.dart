import 'package:dio/dio.dart';

// import '../../../model/user/download_response.dart';
import '../utils.dart';

class DownloadHelper {
  late Dio dio;
  late CancelToken cancelToken;

  DownloadHelper() {
    dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 3)));
    cancelToken = CancelToken();
  }

  // Future<DownloadResponse> downloadFile(String url, String fileName,
  //     Function(int progress) downloadProgress) async {
  //   var savePath = await Utils.getFilePath(fileName);
  //   try {
  //     await dio.download(url, savePath, onReceiveProgress: (rec, total) {
  //       downloadProgress(rec * 100 ~/ total);
  //     }, cancelToken: cancelToken);
  //     return DownloadResponse(true, savePath);
  //   } on DioError {
  //     return DownloadResponse(false, null);
  //   }
  // }

  close() {
    cancelToken.cancel();
    dio.close();
  }
}
