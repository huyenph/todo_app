import 'package:flutter/material.dart';
import 'package:todo_app/src/core/state/base_state.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({Key? key}) : super(key: key);

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends BaseState<CompleteScreen> {
  @override
  Widget buildBody() {
    return const Center(
      child: Text('Complete Screen'),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() => null;
}
