import 'package:dio/dio.dart';

class NetworkService {
  static Dio? _api;

  NetworkService() {
    _api ??= Dio(
      BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
      ),
    );
  }

  void _setHeader() {
    _api!.options.headers.clear();
    _api!.options.headers['Connection'] = 'keep-alive';
  }

  Future<Response<dynamic>> get(String path) async {
    _setHeader();
    return await _api!.get(path);
  }
}
