import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/src/domain/model/todo.dart';

class Boxes {
  static init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    Hive
      ..init(appDocPath)
      ..registerAdapter(TodoAdapter());
    await Hive.openBox<Todo>('todos');
  }

  static Box<Todo> getTodos() => Hive.box<Todo>('todos');
}
