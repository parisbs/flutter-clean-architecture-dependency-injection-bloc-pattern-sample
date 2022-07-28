import 'package:apitest/domain/entities/post.dart';
import 'package:async/async.dart';

abstract class PostRepository {
  Future<Result<List<Post>>> getPosts();
  Future<Result<Post>> getPost(int id);
}
