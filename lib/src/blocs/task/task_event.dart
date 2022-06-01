part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class OnDateChanged extends TaskEvent {
  final DateTime dateTime;
  final bool isStartDate;

  const OnDateChanged(this.dateTime, this.isStartDate);

  @override
  List<Object?> get props => [dateTime, isStartDate];
}

class OnTaskCreated extends TaskEvent {
  final Todo todo;

  const OnTaskCreated(this.todo);

  @override
  List<Object?> get props => [todo];
}

class OnTaskUpdated extends TaskEvent {
  final Todo todo;

  const OnTaskUpdated(this.todo);

  @override
  List<Object?> get props => [todo];
}

class OnTaskUpdateStatus extends TaskEvent {
  final Todo todo;
  final bool status;

  const OnTaskUpdateStatus(this.todo, this.status);

  @override
  List<Object?> get props => [todo, status];
}

class OnTaskDeleted extends TaskEvent {
  final Todo todo;

  const OnTaskDeleted(this.todo);

  @override
  List<Object?> get props => [todo];
}


