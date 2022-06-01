import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';

class TodoUseCase {
  final TodoRepository _todoRepository;

  const TodoUseCase(this._todoRepository);

  Future<void> createTask(Todo todo) => _todoRepository.createTask(todo);

  Future<void> updateTask(Todo todo, int index) =>
      _todoRepository.updateTask(todo, index);
}
