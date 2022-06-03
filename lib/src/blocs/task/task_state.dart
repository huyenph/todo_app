part of 'task_bloc.dart';

class OnDateChangedState extends TaskState {
  final DateTime dateTime;
  final bool isStartDate;

  const OnDateChangedState(this.dateTime, this.isStartDate);

  @override
  List<Object?> get props => [dateTime, isStartDate];
}

class TaskState extends Equatable {
  final bool? isCreateSuccess;
  final bool? isUpdateSuccess;
  final bool? isUpdateStatusSuccess;
  final bool? isDeleteSuccess;
  final String? message;

  const TaskState({
    this.isCreateSuccess,
    this.isUpdateSuccess,
    this.isUpdateStatusSuccess,
    this.isDeleteSuccess,
    this.message = '',
  });

  TaskState copyWith({
    bool? isCreateSuccess,
    bool? isUpdateSuccess,
    bool? isUpdateStatusSuccess,
    bool? isDeleteSuccess,
    String? message,
  }) {
    return TaskState(
      isCreateSuccess: isCreateSuccess ?? this.isCreateSuccess,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
      isUpdateStatusSuccess:
          isUpdateStatusSuccess ?? this.isUpdateStatusSuccess,
      isDeleteSuccess: isDeleteSuccess ?? this.isDeleteSuccess,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        isCreateSuccess,
        isUpdateSuccess,
        isUpdateStatusSuccess,
        isDeleteSuccess,
        message,
      ];
}

class OnTaskSearchedState extends TaskState {
  final String query;

  const OnTaskSearchedState(this.query);

  @override
  List<Object?> get props => [query];
}
