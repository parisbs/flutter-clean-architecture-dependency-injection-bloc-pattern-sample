import 'package:apitest/data/models/comment_model.dart';

abstract class CommentRemote {
  Future<List<CommentModel>> getPostComments(int postId);
}
