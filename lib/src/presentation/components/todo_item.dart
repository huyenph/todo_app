import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/model/create_task_arguments.dart';
import 'package:todo_app/src/domain/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final ValueChanged onChanged;
  final GestureTapCallback onDelete;
  final int currentIndex;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onChanged,
    required this.onDelete,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, '/create-task',
          arguments: CreateTaskArguments(todo, currentIndex)),
      title: Text(
        todo.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        todo.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      leading: Checkbox(
        onChanged: onChanged,
        value: todo.status == 1,
      ),
      trailing: GestureDetector(
        onTap: onDelete,
        child: const Icon(Icons.close),
      ),
    );
  }
}
