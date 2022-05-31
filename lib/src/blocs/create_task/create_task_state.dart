part of 'create_task_bloc.dart';

@immutable
abstract class CreateTaskState extends Equatable {
  const CreateTaskState();

  @override
  List<Object?> get props => [];
}

class InitialState extends CreateTaskState {
  const InitialState();
}

class OnDateChangedState extends CreateTaskState {
  final DateTime dateTime;
  final bool isStartDate;

  const OnDateChangedState(this.dateTime, this.isStartDate);

  @override
  List<Object?> get props => [dateTime, isStartDate];
}

class OnTaskCreatedState extends CreateTaskState {
  final bool isSuccess;

  const OnTaskCreatedState(this.isSuccess);

  @override
  List<Object?> get props => [isSuccess];
}
