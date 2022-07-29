import 'package:apitest/data/datasources/remote/comment/comment_remote.dart';
import 'package:apitest/data/datasources/remote/comment/comment_remote_impl.dart';
import 'package:apitest/data/datasources/remote/comment/comment_service.dart';
import 'package:apitest/data/datasources/remote/post/post_remote.dart';
import 'package:apitest/data/datasources/remote/post/post_remote_impl.dart';
import 'package:apitest/data/datasources/remote/post/post_service.dart';
import 'package:apitest/data/repositories/comment_repository_impl.dart';
import 'package:apitest/data/repositories/post_repository_impl.dart';
import 'package:apitest/domain/repositories/comment_repository.dart';
import 'package:apitest/domain/repositories/post_repository.dart';
import 'package:apitest/domain/usecases/get_post.dart';
import 'package:apitest/domain/usecases/get_post_comments.dart';
import 'package:apitest/domain/usecases/get_posts.dart';
import 'package:apitest/presentation/home/bloc/home_bloc.dart';
import 'package:apitest/presentation/post_details/bloc/post_details_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector.registerSingleton(Dio());
  injector.registerSingleton<CommentService>(CommentService(injector()));
  injector.registerSingleton<PostService>(PostService(injector()));
  injector.registerSingleton<CommentRemote>(CommentRemoteImpl(service: injector()));
  injector.registerSingleton<PostRemote>(PostRemoteImpl(service: injector()));
  injector.registerSingleton<CommentRepository>(CommentRepositoryImpl(remoteDataSource: injector()));
  injector.registerSingleton<PostRepository>(PostRepositoryImpl(remoteDataSource: injector()));
  injector.registerFactory<GetPost>(() => GetPost(repository: injector()));
  injector.registerFactory<GetPostComments>(() => GetPostComments(repository: injector()));
  injector.registerFactory<GetPosts>(() => GetPosts(repository: injector()));
  injector.registerSingleton<HomeBloc>(HomeBloc(getPostsUseCase: injector()));
  injector.registerSingleton<PostDetailsCubit>(PostDetailsCubit(injector()));
}
