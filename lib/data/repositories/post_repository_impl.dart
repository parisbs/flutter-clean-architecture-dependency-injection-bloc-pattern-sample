import 'package:apitest/core/extensions/result_extensions.dart';
import 'package:apitest/core/extensions/list_extensions.dart';
import 'package:apitest/data/datasources/remote/post/post_remote.dart';
import 'package:apitest/data/models/post_model.dart';
import 'package:apitest/domain/entities/post.dart';
import 'package:apitest/domain/repositories/post_repository.dart';
import 'package:async/async.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required this.remoteDataSource});

  final PostRemote remoteDataSource;

  @override
  Future<Result<List<Post>>> getPosts() {
    return Result.capture(remoteDataSource.getPosts())
        .map((data) => data.mapList((e) => e.toPost()));
  }

  @override
  Future<Result<Post>> getPost(int id) {
    return Result.capture(remoteDataSource.getPost(id))
        .map((data) => data.toPost());
  }
}

extension on PostModel {
  Post toPost() {
    return Post(
      id: id ?? -1,
      title: title ?? 'No title',
      body: body ?? 'No description',
    );
  }
}
