import 'package:apitest/data/models/post_model.dart';

abstract class PostRemote {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getPost(int id);
}
