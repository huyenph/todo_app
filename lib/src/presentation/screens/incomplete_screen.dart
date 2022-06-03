import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/blocs/task/task_bloc.dart';
import 'package:todo_app/src/core/state/base_state.dart';
import 'package:todo_app/src/data/datasources/boxes.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/presentation/components/todo_list_view.dart';

class IncompleteScreen extends StatefulWidget {
  const IncompleteScreen({Key? key}) : super(key: key);

  @override
  State<IncompleteScreen> createState() => _IncompleteScreenState();
}

class _IncompleteScreenState extends BaseState<IncompleteScreen> {
  @override
  Widget buildBody() {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return ValueListenableBuilder<Box<Todo>>(
          valueListenable: Boxes.getTodos().listenable(),
          builder: (context, box, _) {
            final todos = box.values.toList().cast<Todo>();
            final incompleteTodos = todos.where((i) => i.status == 0).toList();
            incompleteTodos
                .sort((a, b) => b.modifyDate.compareTo(a.modifyDate));
            return TodoListView(
              mContext: context,
              list: incompleteTodos,
            );
          },
        );
      },
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() => null;
}
