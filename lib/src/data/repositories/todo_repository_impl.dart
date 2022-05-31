import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  @override
  Future<List<Todo>>? getAllTasks() async {
    try {
      // await Hive.openBox('todos');
      var todoBox = Hive.box('todos');
      print(todoBox.values);
      return todoBox.values as List<Todo>;
    } catch (e) {
      return Future.value(null);
    }
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
