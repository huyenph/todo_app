part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class OnGetAllTasks extends TaskEvent {
  const OnGetAllTasks();
}

class OnGetCompleteTasks extends TaskEvent {
  final TodoStatus todoStatus;

  const OnGetCompleteTasks(this.todoStatus);

  @override
  List<Object?> get props => [todoStatus];
}

class OnGetIncompleteTasks extends TaskEvent {
  final TodoStatus todoStatus;

  const OnGetIncompleteTasks(this.todoStatus);

  @override
  List<Object?> get props => [todoStatus];
}
