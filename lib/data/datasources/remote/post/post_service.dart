import 'package:apitest/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class PostService {
  factory PostService(Dio dio, {String baseUrl}) = _PostService;

  @GET("/posts")
  Future<List<PostModel>> getPosts();

  @GET("/posts/{id}")
  Future<PostModel> getPost(@Path("id") int id);
}
