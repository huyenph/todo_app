part of 'injector_setup.dart';

void setupDependent() {
  injector.registerSingleton<TodoRepository>(TodoRepositoryImpl());
  injector.registerSingleton<TodoUseCase>(TodoUseCase(injector()));
  injector.registerSingleton<CreateTaskRepository>(CreateTaskRepositoryImpl());
  injector.registerSingleton<CreateTaskUseCase>(CreateTaskUseCase(injector()));
}
