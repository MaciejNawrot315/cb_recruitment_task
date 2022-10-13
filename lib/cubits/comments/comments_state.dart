part of 'comments_cubit.dart';

@immutable
abstract class CommentsState {
  final List<Comment> comments;
  const CommentsState({
    required this.comments,
  });
}

class CommentsInitial extends CommentsState {
  const CommentsInitial({
    required super.comments,
  });
}

class CommentsLoading extends CommentsState {
  const CommentsLoading({
    required super.comments,
  });
}

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
