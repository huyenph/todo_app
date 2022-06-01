import 'package:todo_app/src/data/datasources/boxes.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  @override
  Future<bool> createTask(Todo todo) {
    try {
      var todoBox = Boxes.getTodos();
      todoBox.put(todo.id, todo);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateTask(Todo todo) {
    try {
      var todoBox = Boxes.getTodos();
      Todo? t = todoBox.get(todo.id);
      if (t != null) {
        t
          ..title = todo.title
          ..description = todo.description
          ..status = todo.status
          ..startDate = todo.startDate
          ..endDate = todo.endDate;
        t.save();
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateTaskStatus(Todo todo, bool value) {
    try {
      var todoBox = Boxes.getTodos();
      Todo? t = todoBox.get(todo.id);
      if (t != null) {
        t.status = value ? 1 : 0;
        t.save();
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<bool> deleteTask(Todo todo) {
    try {
      var todoBox = Boxes.getTodos();
      todoBox.delete(todo.id);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }
}
