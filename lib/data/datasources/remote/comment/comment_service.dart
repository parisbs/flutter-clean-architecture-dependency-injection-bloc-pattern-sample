import 'package:apitest/data/models/comment_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class CommentService {
  factory CommentService(Dio dio, {String baseUrl}) = _CommentService;

  @GET('/posts/{postId}/comments')
  Future<List<CommentModel>> getPostComments(@Path('postId') int postId);
}
