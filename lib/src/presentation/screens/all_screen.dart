import 'package:flutter/material.dart';
import 'package:todo_app/src/core/state/base_state.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends BaseState<AllScreen> {
  @override
  Widget buildBody() {
    return const Center(
      child: Text('All'),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() => null;
}
