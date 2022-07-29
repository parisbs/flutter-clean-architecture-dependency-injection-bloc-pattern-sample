import 'package:apitest/l10n/l10n.dart';
import 'package:apitest/presentation/post_details/view/post_comments_list.dart';
import 'package:apitest/presentation/post_details/view/post_details_arguments.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  static const String routeName = '/post_details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PostDetailsArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                args.body,
                textAlign: TextAlign.start,
              ),
              Semantics(
                header: true,
                child: Text(
                  context.l10n.comments,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: PostCommentsList(args.postId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
