import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/application.dart';
import 'package:todo_app/src/core/application_observer.dart';
import 'package:todo_app/src/di/injector_setup.dart';
import 'package:todo_app/src/domain/model/todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive
    ..init(appDocPath)
    ..registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  BlocOverrides.runZoned(
    () => runApp(const Application()),
    blocObserver: ApplicationObserver(),
  );
}
