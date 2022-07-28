import 'package:apitest/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostListTile extends StatelessWidget {
  const PostListTile({
    super.key,
    required this.post
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
    );
  }
}
