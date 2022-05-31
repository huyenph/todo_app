import 'package:todo_app/src/domain/model/todo.dart';

abstract class CreateTaskRepository {
  Future<void> createTask(TodoAdapter todoAdapter);
}
