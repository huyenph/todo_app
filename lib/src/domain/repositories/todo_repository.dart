import 'package:todo_app/src/domain/model/todo.dart';

abstract class TodoRepository {
  Future<bool> createTask(Todo todo);

  Future<bool> updateTask(Todo todo);

  Future<bool> updateTaskStatus(Todo todo, bool value);

  Future<bool> deleteTask(Todo todo);
}
