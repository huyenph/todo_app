import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';

class TodoUseCase {
  final TodoRepository _todoRepository;

  const TodoUseCase(this._todoRepository);

  Future<List<Todo>> getAllTasks() => _todoRepository.getAllTasks();

  Future<List<Todo>> getCompleteTasks() => _todoRepository.getCompleteTasks();

  Future<List<Todo>> getIncompleteTasks() =>
      _todoRepository.getIncompleteTasks();
}
