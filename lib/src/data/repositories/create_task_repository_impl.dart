import 'package:todo_app/src/data/datasources/boxes.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/create_task_repository.dart';

class CreateTaskRepositoryImpl extends CreateTaskRepository {
  @override
  Future<void> createTask(Todo todo) async {
    try {
      var todoBox = Boxes.getTodos();
      todoBox.add(todo);
    } catch (e) {
      return Future.value(null);
    }
  }
}
