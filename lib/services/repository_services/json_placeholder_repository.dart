import 'package:code_borthers_recruitment_task/models/comment.dart';
import 'package:code_borthers_recruitment_task/models/photo.dart';
import 'package:code_borthers_recruitment_task/services/network_services/json_placeholder_services.dart';
import 'package:dio/dio.dart';

class JsonPlaceholderRepository {
  static Future<List<Photo>> getPhotos() async {
    Response<dynamic> response = await JsonPlaceholderServices.getPhotos();
    List<Photo> listOfPhotos = List<Photo>.from(
      response.data.map(
        (photo) => Photo.fromJson(photo),
      ),
    );
    return listOfPhotos;
  }

  static Future<List<Comment>> getComments() async {
    Response<dynamic> response = await JsonPlaceholderServices.getComments();
    return List<Comment>.from(
      response.data.map(
        (photo) => Comment.fromJson(photo),
      ),
    );
  }
}
