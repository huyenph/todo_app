import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/create_task_repository.dart';

class CreateTaskUseCase {
  final CreateTaskRepository _createTaskRepository;

  const CreateTaskUseCase(this._createTaskRepository);

  Future<void> createTask(TodoAdapter todoAdapter) =>
      _createTaskRepository.createTask(todoAdapter);
}
