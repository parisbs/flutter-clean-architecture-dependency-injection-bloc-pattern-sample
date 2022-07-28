import 'package:apitest/l10n/l10n.dart';
import 'package:apitest/presentation/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationsDelegates,
      supportedLocales: context.supportedLocales,
      onGenerateTitle: (context) => context.l10n.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
