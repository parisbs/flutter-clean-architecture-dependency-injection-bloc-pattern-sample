part of 'post_details_cubit.dart';

enum PostDetailsStatus { loading, success, failure }

class PostDetailsState extends Equatable {
  const PostDetailsState._({
    this.status = PostDetailsStatus.loading,
    this.postComments = const <Comment>[],
    this.errorMessage = ''
});

  const PostDetailsState.loading()
  : this._();

  const PostDetailsState.success(List<Comment> postComments)
  : this._(status: PostDetailsStatus.success, postComments: postComments);

  const PostDetailsState.failure(String errorMessage)
  : this._(status: PostDetailsStatus.failure, errorMessage: errorMessage);

  final PostDetailsStatus status;
  final List<Comment> postComments;
  final String errorMessage;

  @override
  List<Object> get props => [status, postComments, errorMessage];
}
