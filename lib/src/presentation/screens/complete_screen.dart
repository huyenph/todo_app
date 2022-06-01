import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/blocs/task/task_bloc.dart';
import 'package:todo_app/src/core/state/base_state.dart';
import 'package:todo_app/src/data/datasources/boxes.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/presentation/components/todo_list_view.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({Key? key}) : super(key: key);

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends BaseState<CompleteScreen> {
  @override
  Widget buildBody() {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return ValueListenableBuilder<Box<Todo>>(
          valueListenable: Boxes.getTodos().listenable(),
          builder: (context, box, _) {
            final todos = box.values.toList().cast<Todo>();
            final completeTodos = todos.where((i) => i.status == 1).toList();
            return TodoListView(
              list: completeTodos,
              onChanged: (value) => _onHandleChanged(value),
              onDelete: () {},
            );
          },
        );
      },
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() => null;

  void _onHandleChanged(bool value) {}
}
