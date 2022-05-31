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
    on<OnGetAllTasks>(_onGetAllTasks);
    on<OnGetCompleteTasks>(_onGetCompleteTasks);
    on<OnGetIncompleteTasks>(_onGetIncompleteTasks);
  }

  void _onGetAllTasks(
    OnGetAllTasks event,
    Emitter<TaskState> emitter,
  ) async {
    List<Todo>? result = await _todoUseCase.getAllTasks();
    if (result != null) {
      print(result);
    }
  }

  void _onGetCompleteTasks(
    OnGetCompleteTasks event,
    Emitter<TaskState> emitter,
  ) {}

  void _onGetIncompleteTasks(
    OnGetIncompleteTasks event,
    Emitter<TaskState> emitter,
  ) {}
}
