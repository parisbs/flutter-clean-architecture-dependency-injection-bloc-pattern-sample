import 'package:apitest/domain/entities/comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel extends Comment {
  const CommentModel({
    required super.id,
    required super.name,
    required super.email,
    required super.body
});

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
