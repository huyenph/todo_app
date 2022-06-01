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

  TaskBloc(this._todoUseCase) : super(const OnInProgressState()) {
    on<OnDateChanged>(_onDateChanged);
    on<OnTaskCreated>(_onTaskCreated);
    on<OnTaskUpdated>(_onTaskUpdated);
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
      await _todoUseCase.createTask(event.todo);
      emitter(const OnTaskCreatedState(true));
    } catch(e) {
      emitter(const OnTaskCreatedState(false));
    }
  }

  void _onTaskUpdated(
      OnTaskUpdated event,
      Emitter<TaskState> emitter,
      ) async {
    try {
      await _todoUseCase.updateTask(event.todo, event.index);
      emitter(const OnTaskCreatedState(true));
    } catch(e) {
      emitter(const OnTaskUpdatedState(false));
    }
  }
}
