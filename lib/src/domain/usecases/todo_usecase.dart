import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';

class TodoUseCase {
  final TodoRepository _todoRepository;

  const TodoUseCase(this._todoRepository);

  Future<bool> createTask(Todo todo) => _todoRepository.createTask(todo);

  Future<bool> updateTask(Todo todo) => _todoRepository.updateTask(todo);

  Future<bool> updateTaskStatus(Todo todo, bool value) =>
      _todoRepository.updateTaskStatus(todo, value);

  Future<bool> deleteTask(Todo todo) => _todoRepository.deleteTask(todo);
}
