import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/presentation/components/todo_item.dart';

class TodoListView extends StatelessWidget {
  final BuildContext mContext;
  final List<Todo> list;

  const TodoListView({
    Key? key,
    required this.mContext,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.separated(
            itemCount: list.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 0.1),
            itemBuilder: (BuildContext context, int index) => TodoItem(
              mContext: mContext,
              todo: list[index],
            ),
          )
        : const Center(
            child: Text('No task'),
          );
  }
}
