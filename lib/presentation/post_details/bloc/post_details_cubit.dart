import 'package:apitest/core/error/exceptions.dart';
import 'package:apitest/domain/entities/comment.dart';
import 'package:apitest/domain/usecases/get_post_comments.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit(this.getPostCommentsUseCase)
      : super(PostDetailsState.initial());

  final GetPostComments getPostCommentsUseCase;

  Future<void> fetchPostComments(int postId) async {
    emit(state.copyWith(isLoading: true));
    final comments = await getPostCommentsUseCase(postId);
    if (comments.isValue) {
      emit(state.copyWith(
        isLoading: false,
        postComments: comments.asValue!.value,
      ));
    }
    if (comments.isError) {
      final error = comments.asError!.error;
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _getErrorMessage(error),
      ));
    }
  }

  String _getErrorMessage(dynamic error) {
    switch (error) {
      case HttpError:
        return (error as HttpError).message;
      default:
        return error.toString();
    }
  }
}
