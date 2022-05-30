import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/blocs/main/main_cubit.dart';
import 'package:todo_app/src/core/state/base_state.dart';
import 'package:todo_app/src/presentation/screens/all_screen.dart';
import 'package:todo_app/src/presentation/screens/complete_screen.dart';
import 'package:todo_app/src/presentation/screens/incomplete_screen.dart';

const bottomItems = [
  {
    "icon": Icons.all_inbox_outlined,
    "tab": MainTab.all,
    "label": "All",
  },
  {
    "icon": Icons.done_all_outlined,
    "tab": MainTab.complete,
    "label": "Complete",
  },
  {
    "icon": Icons.incomplete_circle_rounded,
    "tab": MainTab.incomplete,
    "label": "Incomplete",
  },
];

const screens = [
  AllScreen(),
  CompleteScreen(),
  IncompleteScreen(),
];

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends BaseState<MainScreen> {
  @override
  Widget buildBody() {
    final selectedTab = context.select((MainCubit cubit) => cubit.state.tab);
    return IndexedStack(
      index: selectedTab.index,
      children: screens,
    );
  }

  @override
  String get appBarTitle =>
      bottomItems[context.select((MainCubit cubit) => cubit.state.tab).index]
          ['label'] as String;

  @override
  FloatingActionButton? buildFloatingActionButton() => FloatingActionButton(
        key: const Key("floatingKey"),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/create-task');
        },
      );

  @override
  BottomNavigationBar? buildBottomNavigationBar() => BottomNavigationBar(
        items: _buildBottomNavigationBarItems(),
        onTap: _onItemTapped,
        currentIndex:
            context.select((MainCubit cubit) => cubit.state.tab).index,
      );

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return bottomItems
        .map(
          (e) => BottomNavigationBarItem(
            icon: Icon((e['icon'] as IconData)),
            label: e['label'] as String,
          ),
        )
        .toList();
  }

  void _onItemTapped(int index) {
    context.read<MainCubit>().setTab(bottomItems[index]['tab'] as MainTab);
  }
}
