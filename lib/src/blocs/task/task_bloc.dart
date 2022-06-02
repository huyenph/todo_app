import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/usecases/todo_usecase.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TodoUseCase _todoUseCase;

  TaskBloc(this._todoUseCase) : super(const TaskState()) {
    on<OnDateChanged>(_onDateChanged);
    on<OnTaskCreated>(_onTaskCreated);
    on<OnTaskUpdated>(_onTaskUpdated);
    on<OnTaskUpdateStatus>(_onTaskUpdateStatus);
    on<OnTaskDeleted>(_onTaskDeleted);
  }

  void _onDateChanged(
    OnDateChanged event,
    Emitter<TaskState> emitter,
  ) {
    emitter(OnDateChangedState(event.dateTime, event.isStartDate));
  }

  void _onTaskCreated(
    OnTaskCreated event,
    Emitter<TaskState> emitter,
  ) async {
    try {
      var result = await _todoUseCase.createTask(event.todo);
      if (result) {
        emitter(state.copyWith(
          isCreateSuccess: true,
          message: 'Create task success!',
        ));
      } else {
        emitter(state.copyWith(
          isCreateSuccess: false,
          message: 'Create task failed. Please try again',
        ));
      }
    } catch (e) {
      emitter(state.copyWith(
        isCreateSuccess: false,
        message: 'Create task failed. Please try again',
      ));
    }
  }

  void _onTaskUpdated(
    OnTaskUpdated event,
    Emitter<TaskState> emitter,
  ) async {
    try {
      var result = await _todoUseCase.updateTask(event.todo);
      if (result) {
        emitter(state.copyWith(
          isCreateSuccess: true,
          message: 'Update task success!',
        ));
      } else {
        emitter(state.copyWith(
          isUpdateSuccess: false,
          message: 'Update task failed. Please try again',
        ));
      }
    } catch (e) {
      emitter(state.copyWith(
        isUpdateSuccess: false,
        message: 'Update task failed. Please try again',
      ));
    }
  }

  void _onTaskUpdateStatus(
    OnTaskUpdateStatus event,
    Emitter<TaskState> emitter,
  ) async {
    try {
      var result =
          await _todoUseCase.updateTaskStatus(event.todo, event.status);
      if (result) {
        emitter(state.copyWith(isUpdateStatusSuccess: false));
      } else {
        emitter(state.copyWith(
          isCreateSuccess: false,
          message: 'Update task status failed. Please try again',
        ));
      }
    } catch (e) {
      emitter(state.copyWith(
        isCreateSuccess: false,
        message: 'Update task status failed. Please try again',
      ));
    }
  }

  void _onTaskDeleted(
    OnTaskDeleted event,
    Emitter<TaskState> emitter,
  ) async {
    try {
      var result = await _todoUseCase.deleteTask(event.todo);
      if (result) {
        emitter(state.copyWith(isDeleteSuccess: true));
      } else {
        emitter(state.copyWith(
          isDeleteSuccess: false,
          message: 'Delete task failed. Please try again',
        ));
      }
    } catch (e) {
      emitter(state.copyWith(
        isDeleteSuccess: false,
        message: 'Delete task failed. Please try again',
      ));
    }
  }
}
