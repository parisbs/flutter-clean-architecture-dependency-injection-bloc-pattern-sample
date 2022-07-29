import 'package:apitest/domain/entities/comment.dart';
import 'package:apitest/domain/repositories/comment_repository.dart';
import 'package:async/async.dart';

class GetPostComments {
  GetPostComments({required this.repository});

  final CommentRepository repository;

  Future<Result<List<Comment>>> call(int postId) async {
    return repository.getPostComments(postId);
  }
}
