import 'package:code_borthers_recruitment_task/main.dart';
import 'package:dio/dio.dart';

class JsonPlaceholderServices {
  static const String jsonPlaceholderPath =
      'https://jsonplaceholder.typicode.com';

  static Future<Response<dynamic>> getPhotos() async {
    Response<dynamic> response = await networkService.get(
      '$jsonPlaceholderPath/photos',
    );
    return response;
  }

  static Future<Response<dynamic>> getComments() async {
    Response<dynamic> response = await networkService.get(
      '$jsonPlaceholderPath/comments',
    );
    return response;
  }
}
