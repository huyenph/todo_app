import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/usecases/create_task_usecase.dart';

part 'create_task_state.dart';

part 'create_task_event.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  final CreateTaskUseCase _createTaskUseCase;

  CreateTaskBloc(this._createTaskUseCase) : super(const InitialState()) {
    on<OnDateChanged>(_onDateChanged);
    on<OnTaskCreated>(_onTaskCreated);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void _onDateChanged(
    OnDateChanged event,
    Emitter<CreateTaskState> emitter,
  ) {
    emitter(OnDateChangedState(event.dateTime, event.isStartDate));
  }

  void _onTaskCreated(
      OnTaskCreated event,
      Emitter<CreateTaskState> emitter,
      ) async {
    try {
      await _createTaskUseCase.createTask(event.todo);
      emitter(const OnTaskCreatedState(true));
    } catch(e) {
      emitter(const OnTaskCreatedState(false));
    }
  }
}
