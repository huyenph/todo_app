import 'package:todo_app/src/domain/model/todo.dart';

abstract class TodoRepository {
  Future<void> createTask(Todo todo);

  Future<void> updateTask(Todo todo, int index);
}
