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

class OnTaskErrorState extends TaskState {
  final String message;

  const OnTaskErrorState(this.message);

  @override
  List<Object?> get props => [];
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
  List<Object?> get props => [];
}

class OnTaskUpdatedState extends TaskState {
  final bool isSuccess;

  const OnTaskUpdatedState(this.isSuccess);

  @override
  List<Object?> get props => [];
}

class OnTaskUpdateStatusState extends TaskState {
  final bool isSuccess;

  const OnTaskUpdateStatusState(this.isSuccess);

  @override
  List<Object?> get props => [];
}

class OnTaskDeletedState extends TaskState {
  final bool isSuccess;

  const OnTaskDeletedState(this.isSuccess);

  @override
  List<Object?> get props => [];
}
