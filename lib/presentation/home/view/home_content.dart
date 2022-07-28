import 'package:apitest/presentation/home/view/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeTitle),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: PostsList(),
          ),
        ),
      ),
    );
  }
}
