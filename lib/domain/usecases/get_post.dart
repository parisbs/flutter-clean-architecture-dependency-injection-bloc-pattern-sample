import 'package:apitest/domain/entities/post.dart';
import 'package:apitest/domain/repositories/post_repository.dart';
import 'package:async/async.dart';

class GetPost {
  GetPost({required this.repository});

  final PostRepository repository;

  Future<Result<Post>> call(int id) async {
    return await repository.getPost(id);
  }
}
