import 'package:dio/dio.dart';

class NetworkService {
  static Dio? _api;

  NetworkService() {
    _api ??= Dio(
      BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        sendTimeout: 5000,
      ),
    );
  }

  void _setHeader() {
    _api!.options.headers.clear();
    _api!.options.headers['Connection'] = 'keep-alive';
    _api!.options.headers["User-Agent"] = "your-user-agent";
  }

  Future<Response<dynamic>> get(String path) async {
    _setHeader();
    return await _api!.get(path);
  }
}
