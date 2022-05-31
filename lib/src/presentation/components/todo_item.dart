import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final ValueChanged onChanged;
  final GestureTapCallback onEdit;
  final GestureTapCallback onDelete;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onEdit,
      title: Text(todo.title),
      subtitle: Text(
        todo.description,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Checkbox(
        onChanged: onChanged,
        value: todo.status == 1,
      ),
      trailing: GestureDetector(
        onTap: onDelete,
        child: const Icon(Icons.delete_outline),
      ),
    );
  }
}
