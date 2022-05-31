part of 'create_task_bloc.dart';

@immutable
abstract class CreateTaskEvent extends Equatable {
  const CreateTaskEvent();

  @override
  List<Object?> get props => [];
}

class OnDateChanged extends CreateTaskEvent {
  final DateTime dateTime;
  final bool isStartDate;

  const OnDateChanged(this.dateTime, this.isStartDate);

  @override
  List<Object?> get props => [dateTime, isStartDate];
}

class OnTaskCreated extends CreateTaskEvent {
  final Todo todo;

  const OnTaskCreated(this.todo);

  @override
  List<Object?> get props => [todo];
}