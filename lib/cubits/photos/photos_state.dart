part of 'photos_cubit.dart';

@immutable
abstract class PhotosState {
  final List<Photo> photos;
  final int pageIndex;
  const PhotosState({
    this.photos = const [],
    this.pageIndex = 1,
  });
}

class PhotosInitialLoading extends PhotosState {}

class PhotosLoading extends PhotosState {
  const PhotosLoading({
    super.photos,
    super.pageIndex,
  });
}

class PhotosLoaded extends PhotosState {
  const PhotosLoaded({
    required super.photos,
    required super.pageIndex,
  });
}

class PhotosInitialError extends PhotosState {
  final String errorMessage;
  const PhotosInitialError({
    required this.errorMessage,
  });
}

class PhotosMoreDownloadError extends PhotosState {
  const PhotosMoreDownloadError({
    required super.pageIndex,
    required super.photos,
  });
}

class PhotosFullyLoaded extends PhotosState {
  const PhotosFullyLoaded({
    required super.photos,
  });
}
