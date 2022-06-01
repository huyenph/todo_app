import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/blocs/task/task_bloc.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/presentation/components/dialog/todo_confirm_dialog.dart';

class TodoItem extends StatelessWidget {
  final BuildContext mContext;
  final Todo todo;

  const TodoItem({
    Key? key,
    required this.mContext,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          Navigator.pushNamed(context, '/create-task', arguments: todo),
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
        onChanged: (value) => _onConfirmChange(value!),
        value: todo.status == 1,
      ),
      trailing: GestureDetector(
        onTap: _onConfirmDelete,
        child: const Icon(CupertinoIcons.clear),
      ),
    );
  }

  void _onConfirmChange(bool value) {
    showDialog(
      context: mContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ToDoConfirmDialog(
          title: 'Change status',
          message: 'Change to ${value ? 'complete' : 'incomplete'}?',
          onPressed: () => mContext.read<TaskBloc>().add(OnTaskUpdateStatus(todo, value)),
        );
      },
    );
  }

  void _onConfirmDelete() {
    showDialog(
      context: mContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ToDoConfirmDialog(
          title: 'Delete this task',
          message: 'Are you sure?',
          onPressed: () => mContext.read<TaskBloc>().add(OnTaskDeleted(todo)),
        );
      },
    );
  }
}
