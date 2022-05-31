import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/domain/model/todo.dart';

class Boxes {
  static Box<Todo> getTodos() => Hive.box<Todo>('todos');
}
