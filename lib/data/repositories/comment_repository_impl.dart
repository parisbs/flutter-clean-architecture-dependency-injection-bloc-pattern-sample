import 'package:apitest/data/datasources/remote/comment/comment_remote.dart';
import 'package:apitest/domain/entities/comment.dart';
import 'package:apitest/domain/repositories/comment_repository.dart';
import 'package:async/async.dart';

class CommentRepositoryImpl implements CommentRepository {
  CommentRepositoryImpl({required this.remoteDataSource});

  final CommentRemote remoteDataSource;

  @override
  Future<Result<List<Comment>>> getPostComments(int postId) async {
    return Result.capture(remoteDataSource.getPostComments(postId));
  }
}
