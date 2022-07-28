import 'package:apitest/domain/entities/post.dart';
import 'package:apitest/domain/repositories/post_repository.dart';
import 'package:async/async.dart';

class GetPosts {
  GetPosts({required this.repository});

  final PostRepository repository;

  Future<Result<List<Post>>> call() async {
    return await repository.getPosts();
  }
}
