part of 'photos_cubit.dart';

@immutable
abstract class PhotosState {
  final List<Photo> photos;
  const PhotosState({
    required this.photos,
  });
}

class PhotosInitial extends PhotosState {
  const PhotosInitial({
    required super.photos,
  });
}

class PhotosLoading extends PhotosState {
  const PhotosLoading({
    required super.photos,
  });
}

class PhotosLoaded extends PhotosState {
  const PhotosLoaded({
    required super.photos,
  });
}

class PhotosError extends PhotosState {
  final String errorMessage;
  const PhotosError({
    required super.photos,
    required this.errorMessage,
  });
}
