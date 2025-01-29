import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/core/cubits/bloc_observer.dart';
import 'package:pure_minds/di.dart';
import 'package:pure_minds/pure_minds_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ],
  );
  init();
  Bloc.observer = MyBlocObserver();
  await Future.delayed(Durations.short1);
  runApp(const PureMindsApp());
}
