import 'package:code_borthers_recruitment_task/models/comment.dart';
import 'package:code_borthers_recruitment_task/services/repository_services/json_placeholder_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(const CommentsInitial(comments: []));

  Future<void> loadComments() async {
    try {
      emit(const CommentsLoading(comments: []));
      List<Comment> loadedComments =
          await JsonPlaceholderRepository.getComments();
      emit(CommentsLoaded(comments: loadedComments));
    } on DioError catch (e) {
      emit(CommentsError(
        comments: const [],
        errorMessage: e.message,
      ));
    }
  }
}
