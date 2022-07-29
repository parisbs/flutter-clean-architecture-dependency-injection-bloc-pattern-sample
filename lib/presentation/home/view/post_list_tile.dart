import 'package:apitest/domain/entities/post.dart';
import 'package:apitest/presentation/post_details/view/post_details_arguments.dart';
import 'package:apitest/presentation/post_details/view/post_details_page.dart';
import 'package:flutter/material.dart';

class PostListTile extends StatelessWidget {
  const PostListTile(this.post, {super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      onTap: () => Navigator.pushNamed(
          context,
        PostDetailsPage.routeName,
        arguments: PostDetailsArguments(
            postId: post.id,
            title: post.title,
            body: post.body,
        ),
      ),
    );
  }
}
