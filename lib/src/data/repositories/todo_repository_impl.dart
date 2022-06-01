import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/data/datasources/boxes.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  @override
  Future<void> createTask(Todo todo) async {
    try {
      var todoBox = Boxes.getTodos();
      todoBox.add(todo);
    } catch (e) {
      return Future.value(null);
    }
  }

  @override
  Future<void> updateTask(Todo todo, int index) async {
    try {
      var todoBox = Boxes.getTodos();
      todoBox.putAt(index, todo);
    } catch (e) {
      return Future.value(null);
    }
  }
}
