import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/data/repositories/create_task_repository_impl.dart';
import 'package:todo_app/src/data/repositories/todo_repository_impl.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/create_task_repository.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';
import 'package:todo_app/src/domain/usecases/create_task_usecase.dart';
import 'package:todo_app/src/domain/usecases/todo_usecase.dart';

part 'independent_injector.dart';

part 'dependent_injector.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  setupIndependent();
  setupDependent();
}