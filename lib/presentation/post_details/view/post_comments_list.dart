import 'package:apitest/core/widgets/error_message_with_retry.dart';
import 'package:apitest/core/widgets/loading_circular_indicator.dart';
import 'package:apitest/injection_container.dart' as di;
import 'package:apitest/l10n/l10n.dart';
import 'package:apitest/presentation/post_details/bloc/post_details_cubit.dart';
import 'package:apitest/presentation/post_details/view/post_comment_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCommentsList extends StatelessWidget {
  const PostCommentsList(
      this.postId,
      {super.key,}
      );

  final int postId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostDetailsCubit>(
        create: (context) =>
        di.injector.get<PostDetailsCubit>()..fetchPostComments(postId),
      child: BlocBuilder<PostDetailsCubit, PostDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingCircularIndicator();
          } else if (state.errorMessage != null) {
            return ErrorMessageWithRetry(
                message: state.errorMessage!,
                onRetryPressed: (context) => context.read<PostDetailsCubit>().fetchPostComments(postId),
            );
          } else {
            return state.postComments.isEmpty
                ? Text(
                context.l10n.no_comments,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            )
                : ListView.builder(
              itemCount: state.postComments.length,
                itemBuilder: (context, index) =>
                    PostCommentListTile(state.postComments[index]));
          }
        },
      ),
    );
  }
}
