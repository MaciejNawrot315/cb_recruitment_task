import 'package:code_borthers_recruitment_task/models/photo.dart';
import 'package:code_borthers_recruitment_task/services/repository_services/json_placeholder_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  static const amountToLoad = 30;
  PhotosCubit()
      : super(
          PhotosInitialLoading(),
        );

  Future<void> loadPhotos() async {
    try {
      emit(PhotosInitialLoading());
      List<Photo> loadedPhotos =
          await JsonPlaceholderRepository.getPhotos(1, amountToLoad);
      emit(PhotosLoaded(pageIndex: 1, photos: loadedPhotos));
    } on DioError catch (e) {
      emit(PhotosInitialError(
        errorMessage: e.message,
      ));
    }
  }

  Future<void> loadMorePhotos() async {
    try {
      emit(PhotosLoading(pageIndex: state.pageIndex + 1, photos: state.photos));
      List<Photo> fetchedPhotos = await JsonPlaceholderRepository.getPhotos(
          state.pageIndex, amountToLoad);
      List<Photo> newStateList = state.photos.toList();
      newStateList.addAll(fetchedPhotos);
      if (fetchedPhotos.length != amountToLoad) {
        emit(PhotosFullyLoaded(
          photos: newStateList,
        ));
      } else {
        emit(PhotosLoaded(pageIndex: state.pageIndex, photos: newStateList));
      }
    } on DioError catch (e) {
      emit(PhotosMoreDownloadError(
        pageIndex: state.pageIndex - 1,
        photos: state.photos,
      ));
    }
  }
}
