part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  const HomeSuccess({required this.posts});

  final List<Post> posts;

  @override
  List<Object> get props => [posts];
}

class HomeFailure extends HomeState {
  const HomeFailure({required this.message});

  final String message;

@override
List<Object> get props => [message];
}
