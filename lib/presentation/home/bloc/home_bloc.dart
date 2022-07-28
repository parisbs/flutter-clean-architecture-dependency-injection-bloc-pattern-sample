import 'package:apitest/core/error/failures.dart';
import 'package:apitest/domain/entities/post.dart';
import 'package:apitest/domain/usecases/get_posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getPostsUseCase}) : super(HomeLoading()) {
    on<FetchPostsHomeEvent>((event, emit) async {
      emit(HomeLoading());
      final posts = await getPostsUseCase();
      if (posts.isValue) {
        emit(HomeSuccess(posts: posts.asValue!.value));
      }
      if (posts.isError) {
        final error = posts.asError!.error;
        switch (error) {
          case HttpFailure:
            emit(HomeFailure(message: (error as HttpFailure).statusMessage));
            break;
          default:
            emit(HomeFailure(message: error.toString()));
        }
      }
    });
  }

  final GetPosts getPostsUseCase;
}
