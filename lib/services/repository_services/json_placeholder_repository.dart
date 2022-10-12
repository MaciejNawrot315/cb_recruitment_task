import 'package:code_borthers_recruitment_task/models/comment.dart';
import 'package:code_borthers_recruitment_task/models/photo.dart';
import 'package:code_borthers_recruitment_task/services/network_services/json_placeholder_services.dart';
import 'package:dio/dio.dart';

class JsonPlaceholderRepository {
  static Future<List<Photo>> getPhotos(int amount) async {
    Response<dynamic> response =
        await JsonPlaceholderServices.getPhotos(amount);
    List<Photo> listOfPhotos = List<Photo>.from(
      response.data.map(
        (photo) => Photo.fromJson(photo),
      ),
    );
    return listOfPhotos;
  }

  static Future<List<Comment>> getComments(int amount) async {
    Response<dynamic> response =
        await JsonPlaceholderServices.getComments(amount);
    return List<Comment>.from(
      response.data.map(
        (photo) => Comment.fromJson(photo),
      ),
    );
  }
}
