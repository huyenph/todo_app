import 'package:todo_app/src/domain/model/todo.dart';

class CreateTaskArguments {
  final Todo todo;
  final int index;

  const CreateTaskArguments(this.todo, this.index);
}