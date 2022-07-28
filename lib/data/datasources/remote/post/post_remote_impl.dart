import 'package:apitest/core/error/exceptions.dart';
import 'package:apitest/data/datasources/remote/post/post_remote.dart';
import 'package:apitest/data/datasources/remote/post/post_service.dart';
import 'package:apitest/data/models/post_model.dart';
import 'package:dio/dio.dart';

class PostRemoteImpl implements PostRemote {
  PostRemoteImpl({required this.service});

  final PostService service;

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      return await service.getPosts();
    } on DioError catch(e) {
      throw HttpError(
          message: e.response?.statusMessage ?? e.message,
        code: e.response?.statusCode ?? -1,
        stackTrace: e.stackTrace
      );
    }
  }

  @override
  Future<PostModel> getPost(int id) async {
    try {
      return await service.getPost(id);
    } on DioError catch(e) {
      throw HttpError(
          message: e.response?.statusMessage ?? e.message,
          code: e.response?.statusCode ?? -1,
          stackTrace: e.stackTrace
      );
    }
  }
}
