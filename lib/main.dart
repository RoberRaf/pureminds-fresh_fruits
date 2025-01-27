import 'package:flutter/material.dart';
import 'package:pure_minds/di.dart';
import 'package:pure_minds/pure_minds_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  await Future.delayed(Durations.short1);
  runApp(const PureMindsApp());
}
