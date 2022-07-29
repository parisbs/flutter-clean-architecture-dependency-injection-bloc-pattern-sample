import 'package:apitest/core/error/exceptions.dart';
import 'package:apitest/domain/entities/comment.dart';
import 'package:apitest/domain/usecases/get_post_comments.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit(this.getPostCommentsUseCase) : super(const PostDetailsState.loading());

  final GetPostComments getPostCommentsUseCase;

  Future<void> fetchPostComments(int postId) async {
    emit(const PostDetailsState.loading());
    final result = await getPostCommentsUseCase(postId);
    if (result.isValue) {
      emit(PostDetailsState.success(result.asValue!.value));
    }
    if (result.isError) {
      final error = result.asError!.error;
      switch (error) {
        case HttpError:
          emit(PostDetailsState.failure((error as HttpError).toString()));
          break;
        default:
          emit(PostDetailsState.failure(error.toString()));
      }
    }
  }
}
