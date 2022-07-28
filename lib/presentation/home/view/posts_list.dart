import 'package:apitest/injection_container.dart' as di;
import 'package:apitest/presentation/home/bloc/home_bloc.dart';
import 'package:apitest/presentation/home/view/post_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostsList extends StatelessWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => di.injector.get<HomeBloc>()..add(FetchPostsHomeEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return CircularProgressIndicator(
              semanticsLabel: AppLocalizations.of(context)!.loading,
            );
          } else if (state is HomeFailure) {
            return Text(state.message);
          } else if (state is HomeSuccess) {
            return state.posts.isEmpty
                ? Text(AppLocalizations.of(context)!.no_posts)
                : ListView.builder(
              itemCount: state.posts.length,
                itemBuilder: (context, index) => PostListTile(post: state.posts[index])
            );
          } else {
            return Text(AppLocalizations.of(context)!.unable_to_fetch_posts);
          }
        },
      ),
    );
  }
}
