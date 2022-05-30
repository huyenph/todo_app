part of 'injector_setup.dart';

void setupIndependent() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox('todos');
}