import 'package:apitest/injection_container.dart' as di;
import 'package:apitest/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Required to enable screen readers support for web
  RendererBinding.instance.setSemanticsEnabled(true);
  await di.init();
  runApp(const App());
}
