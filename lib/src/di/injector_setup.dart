import 'package:get_it/get_it.dart';
import 'package:todo_app/src/data/repositories/todo_repository_impl.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';
import 'package:todo_app/src/domain/usecases/todo_usecase.dart';

part 'independent_injector.dart';

part 'dependent_injector.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  setupIndependent();
  setupDependent();
}
