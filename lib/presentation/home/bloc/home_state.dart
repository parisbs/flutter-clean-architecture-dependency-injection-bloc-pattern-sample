part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<Post> posts;

  const HomeState({
    required this.isLoading,
    required this.errorMessage,
    required this.posts,
  });

  factory HomeState.initial() {
    return const HomeState(isLoading: false, errorMessage: null, posts: []);
  }

  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Post>? posts,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      posts: posts ?? this.posts,
    );
  }

  @override
  String toString() =>
      'HomeState{ isLoading: $isLoading, errorMessage: $errorMessage, posts: $posts,}';

  @override
  List<Object?> get props => [isLoading, errorMessage, posts];
}
