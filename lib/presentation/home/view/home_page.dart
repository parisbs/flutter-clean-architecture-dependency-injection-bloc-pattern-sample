import 'package:apitest/l10n/l10n.dart';
import 'package:apitest/presentation/home/view/posts_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.homeTitle),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: PostsList(),
        ),
      ),
    );
  }
}
