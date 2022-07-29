import 'package:apitest/core/error/exceptions.dart';
import 'package:apitest/data/datasources/remote/comment/comment_remote.dart';
import 'package:apitest/data/datasources/remote/comment/comment_service.dart';
import 'package:apitest/data/models/comment_model.dart';
import 'package:dio/dio.dart';

class CommentRemoteImpl implements CommentRemote {
  CommentRemoteImpl({required this.service});

  final CommentService service;

  @override
  Future<List<CommentModel>> getPostComments(int postId) async {
    try {
      return await service.getPostComments(postId);
    } on DioError catch(e) {
      throw HttpError(
          message: e.response?.statusMessage ?? e.message,
          code: e.response?.statusCode ?? -1,
          stackTrace: e.stackTrace
      );
    }
  }
}
