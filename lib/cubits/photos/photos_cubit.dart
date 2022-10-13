import 'package:code_borthers_recruitment_task/models/photo.dart';
import 'package:code_borthers_recruitment_task/services/repository_services/json_placeholder_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(const PhotosInitial(photos: []));

  Future<void> loadPhotos() async {
    try {
      emit(const PhotosLoading(photos: []));
      List<Photo> loadedPhotos = await JsonPlaceholderRepository.getPhotos();
      emit(PhotosLoaded(photos: loadedPhotos));
    } on DioError catch (e) {
      emit(PhotosError(
        photos: const [],
        errorMessage: e.message,
      ));
    }
  }
}
