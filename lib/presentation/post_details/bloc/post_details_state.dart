part of 'post_details_cubit.dart';

@immutable
class PostDetailsState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<Comment> postComments;

  const PostDetailsState({
    required this.isLoading,
    required this.errorMessage,
    required this.postComments,
});

  factory PostDetailsState.initial() {
    return const PostDetailsState(isLoading: false, errorMessage: null, postComments: []);
  }

  PostDetailsState copyWith({
  bool? isLoading,
    String? errorMessage,
    List<Comment>? postComments,
}) {
    return PostDetailsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      postComments: postComments ?? this.postComments,
    );
  }

  @override
  String toString() =>
      'PostDetailsState{ isLoading: $isLoading, errorMessage: $errorMessage, postComments: $postComments,}';

  @override
  List<Object?> get props => [isLoading, errorMessage, postComments];
}
