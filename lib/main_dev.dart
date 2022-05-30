import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application.dart';
import 'package:todo_app/src/core/application_observer.dart';
import 'package:todo_app/src/di/injector_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  BlocOverrides.runZoned(
    () => runApp(const Application()),
    blocObserver: ApplicationObserver(),
  );
}
