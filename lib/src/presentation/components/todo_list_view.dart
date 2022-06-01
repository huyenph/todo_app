import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/presentation/components/todo_item.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> list;
  final ValueChanged onChanged;
  final GestureTapCallback onDelete;

  const TodoListView({
    Key? key,
    required this.list,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.separated(
            itemCount: list.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 0.1),
            itemBuilder: (BuildContext context, int index) => TodoItem(
              todo: list[index],
              onChanged: onChanged,
              onDelete: onDelete,
              currentIndex: index,
            ),
          )
        : const Center(
            child: Text('No task'),
          );
  }
}
