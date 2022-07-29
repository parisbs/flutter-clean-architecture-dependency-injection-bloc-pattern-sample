import 'package:apitest/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LoadingCircularIndicator extends StatelessWidget {
  const LoadingCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      semanticsLabel: context.l10n.loading,
    );
  }
}
