import 'package:todo_app/src/data/datasources/database_helper.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  // final DatabaseHelper _databaseHelper;

  // TodoRepositoryImpl(this._databaseHelper);

  @override
  Future<void> createTask(Todo todo) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getCompleteTasks() {
    // TODO: implement getCompleteTasks
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getIncompleteTasks() {
    // TODO: implement getIncompleteTasks
    throw UnimplementedError();
  }

}