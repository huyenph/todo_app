import 'package:todo_app/src/domain/model/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAllTasks();

  Future<List<Todo>> getCompleteTasks();

  Future<List<Todo>> getIncompleteTasks();
}
