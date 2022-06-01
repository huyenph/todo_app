part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class InitialState extends TaskState {
  const InitialState();
}

class OnInProgressState extends TaskState {
  const OnInProgressState();
}

class OnDateChangedState extends TaskState {
  final DateTime dateTime;
  final bool isStartDate;

  const OnDateChangedState(this.dateTime, this.isStartDate);

  @override
  List<Object?> get props => [dateTime, isStartDate];
}

class OnTaskCreatedState extends TaskState {
  final bool isSuccess;

  const OnTaskCreatedState(this.isSuccess);

  @override
  List<Object?> get props => [isSuccess];
}

class OnTaskUpdatedState extends TaskState {
  final bool isSuccess;

  const OnTaskUpdatedState(this.isSuccess);

  @override
  List<Object?> get props => [isSuccess];
}
