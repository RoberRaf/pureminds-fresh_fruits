import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pure_minds/di.dart';
import 'package:pure_minds/pure_minds_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
  );
  init();
  await Future.delayed(Durations.short1);
  runApp(const PureMindsApp());
}
