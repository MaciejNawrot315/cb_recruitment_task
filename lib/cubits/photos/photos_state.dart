// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photos_cubit.dart';

@immutable
abstract class PhotosState {
  final List<Photo> photos;
  const PhotosState({
    required this.photos,
  });
}

class PhotosInitial extends PhotosState {
  const PhotosInitial({required super.photos});
}
