import 'package:flutter/material.dart';
import 'package:todo_app/src/core/state/base_state.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends BaseState<CreateTaskScreen> {
  @override
  Widget buildBody() {
    return const Center(
      child: Text('Create task'),
    );
  }
}
