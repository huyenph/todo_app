import 'package:flutter/material.dart';
import 'package:todo_app/src/core/state/base_state.dart';

class IncompleteScreen extends StatefulWidget {
  const IncompleteScreen({Key? key}) : super(key: key);

  @override
  State<IncompleteScreen> createState() => _IncompleteScreenState();
}

class _IncompleteScreenState extends BaseState<IncompleteScreen> {
  @override
  Widget buildBody() {
    return const Center(
      child: Text('Incomplete'),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() => null;
}
