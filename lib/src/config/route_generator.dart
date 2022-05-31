import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/screens/all_screen.dart';
import 'package:todo_app/src/presentation/screens/complete_screen.dart';
import 'package:todo_app/src/presentation/screens/create_task_screen.dart';
import 'package:todo_app/src/presentation/screens/incomplete_screen.dart';
import 'package:todo_app/src/presentation/screens/main_screen.dart';

class RouteGenerator {
  static Route<Object> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const MainScreen());
      case '/all':
        return CupertinoPageRoute(builder: (_) => const AllScreen());
      case '/complete':
        return CupertinoPageRoute(builder: (_) => const CompleteScreen());
      case '/incomplete':
        return CupertinoPageRoute(builder: (_) => const IncompleteScreen());
      case '/create-task':
        return CupertinoPageRoute(builder: (_) => const CreateTaskScreen(restorationId: 'create_task',));
      default:
        return _errorRoute();
    }
  }

  static Route<Object> _errorRoute() {
    return CupertinoPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Oops!\nSomething went wrong.'),
          ),
        ));
  }
}
