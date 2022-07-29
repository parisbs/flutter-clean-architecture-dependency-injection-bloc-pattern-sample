import 'package:apitest/domain/entities/comment.dart';
import 'package:async/async.dart';

abstract class CommentRepository {
  Future<Result<List<Comment>>> getPostComments(int postId);
}
