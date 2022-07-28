import 'package:apitest/injection_container.dart' as di;
import 'package:apitest/presentation/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}