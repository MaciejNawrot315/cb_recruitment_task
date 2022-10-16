part of 'comments_cubit.dart';

@immutable
abstract class CommentsState {
  final List<Comment> comments;
  const CommentsState({
    this.comments = const [],
  });
}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  const CommentsLoaded({
    required super.comments,
  });
}

class CommentsError extends CommentsState {
  final String errorMessage;
  const CommentsError({
    required super.comments,
    required this.errorMessage,
  });
}
