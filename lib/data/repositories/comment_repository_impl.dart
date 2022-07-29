import 'package:apitest/core/extensions/list_extensions.dart';
import 'package:apitest/core/extensions/result_extensions.dart';
import 'package:apitest/data/datasources/remote/comment/comment_remote.dart';
import 'package:apitest/data/models/comment_model.dart';
import 'package:apitest/domain/entities/comment.dart';
import 'package:apitest/domain/repositories/comment_repository.dart';
import 'package:async/async.dart';

class CommentRepositoryImpl implements CommentRepository {
  CommentRepositoryImpl({required this.remoteDataSource});

  final CommentRemote remoteDataSource;

  @override
  Future<Result<List<Comment>>> getPostComments(int postId) async {
    return Result.capture(remoteDataSource.getPostComments(postId))
    .map((data) => data.mapList((e) => e.toComment()));
  }
}

extension on CommentModel {
  Comment toComment() {
    return Comment(
      id: id ?? -1,
      name: name ?? 'No name',
      email: email ?? 'No email',
      body: body ?? 'No comment',
    );
  }
}
