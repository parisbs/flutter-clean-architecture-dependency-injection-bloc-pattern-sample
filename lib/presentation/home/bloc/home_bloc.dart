import 'package:apitest/core/error/exceptions.dart';
import 'package:apitest/domain/entities/post.dart';
import 'package:apitest/domain/usecases/get_posts.dart';
import 'package:apitest/presentation/home.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getPostsUseCase}) : super(HomeState.initial()) {
    on<FetchPostsHomeEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final posts = await getPostsUseCase();
      if (posts.isValue) {
        emit(state.copyWith(
          isLoading: false,
          posts: posts.asValue!.value,
        ));
      }
      if (posts.isError) {
        final error = posts.asError!.error;
        emit(state.copyWith(
          isLoading: false,
          errorMessage: _getErrorMessage(error),
        ));
      }
    });
  }

  String _getErrorMessage(dynamic error) {
    switch (error) {
      case HttpError:
        return (error as HttpError).message;
      default:
        return error.toString();
    }
  }

  final GetPosts getPostsUseCase;
}
