import 'package:apitest/core/error/failures.dart';
import 'package:apitest/data/datasources/remote/post/post_remote.dart';
import 'package:apitest/data/datasources/remote/post/post_service.dart';
import 'package:apitest/data/models/post_model.dart';
import 'package:dio/dio.dart';

class PostRemoteImpl implements PostRemote {
  PostRemoteImpl({required this.service});

  final PostService service;

  @override
  Future<List<PostModel>> getPosts() async {
    return await service.getPosts().catchError((Object obj) {
      if (obj.runtimeType is DioError) {
        final res = (obj as DioError).response;
        throw HttpFailure(statusCode: res?.statusCode ?? 0, statusMessage: res?.statusMessage ?? "");
      } else {
        throw obj;
      }
    });
  }

  @override
  Future<PostModel> getPost(int id) async {
    return await service.getPost(id).catchError((Object obj) {
      if (obj.runtimeType is DioError) {
        final res = (obj as DioError).response;
        throw HttpFailure(statusCode: res?.statusCode ?? 0, statusMessage: res?.statusMessage ?? "");
      } else {
        throw obj;
      }
    });
  }
}
