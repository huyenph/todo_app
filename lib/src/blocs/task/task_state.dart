part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class OnInProgressState extends TaskState {
  const OnInProgressState();
}

class OnGetAllTasksState extends TaskState {
  final List<Todo> todos;

  const OnGetAllTasksState(this.todos);

  @override
  List<Object?> get props => [todos];
}

class OnGetCompleteTasksState extends TaskState {
  final List<Todo> todos;

  const OnGetCompleteTasksState(this.todos);

  @override
  List<Object?> get props => [todos];
}

class OnGetIncompleteTasksState extends TaskState {
  final List<Todo> todos;

  const OnGetIncompleteTasksState(this.todos);

  @override
  List<Object?> get props => [todos];
}
