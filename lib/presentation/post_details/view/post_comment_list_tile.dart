import 'package:apitest/domain/entities/comment.dart';
import 'package:flutter/material.dart';

class PostCommentListTile extends StatelessWidget {
  const PostCommentListTile(this.comment, {super.key});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Semantics(
            header: true,
            focusable: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  comment.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '(${comment.email})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Semantics(
            focusable: true,
            child: Text(
              comment.body,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
