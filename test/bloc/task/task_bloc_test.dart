import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/blocs/task/task_bloc.dart';
import 'package:todo_app/src/di/injector_setup.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/domain/repositories/todo_repository.dart';
import 'package:todo_app/src/domain/usecases/todo_usecase.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

class MockTodoUseCase extends Mock implements TodoUseCase {
  MockTodoUseCase(MockTodoRepository mockTodoRepository);
}

class FakeTodo extends Fake implements Todo {}

Todo testTodo = Todo(
  id: 'id',
  title: 'title',
  description: 'description',
  status: 0,
  startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
  endDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
  modifyDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
);

void main() async {
  await initializeDependencies();

  group('TaskBloc', () {
    late TodoUseCase todoUseCase;

    setUpAll(() {
      registerFallbackValue(FakeTodo());
    });

    setUp(() {
      todoUseCase = MockTodoUseCase(MockTodoRepository());
    });

    TaskBloc createBloc() => TaskBloc(todoUseCase);

    group('Constructor', () {
      test('Work properly', () {
        expect(createBloc, returnsNormally);
      });

      test('Correct initial state', () {
        expect(
          createBloc().state,
          const TaskState(),
        );
      });
    });

    group('OnDateChanged', () {
      blocTest<TaskBloc, TaskState>(
        'Emits a state with new date changed',
        build: createBloc,
        act: (bloc) => bloc.add(OnDateChanged(
          DateTime.fromMillisecondsSinceEpoch(1654174800000),
          true,
        )),
        expect: () => [
          OnDateChangedState(
            DateTime.fromMillisecondsSinceEpoch(1654174800000),
            true,
          ),
        ],
      );
    });

    group('OnTaskCreated', () {
      blocTest<TaskBloc, TaskState>(
        'Test create task',
        setUp: () {
          when(() => todoUseCase.createTask(any()))
              .thenAnswer((_) => Future.value(true));
        },
        build: createBloc,
        act: (bloc) => bloc.add(OnTaskCreated(testTodo)),
        expect: () => [
          const TaskState(
            isCreateSuccess: true,
            message: 'Create task success!',
          ),
        ],
        verify: (bloc) {
          verify(
            () => todoUseCase.createTask(
              any(
                that: isA<Todo>()
                    .having((t) => t.id, 'id', equals('id'))
                    .having((t) => t.title, 'title', equals('title'))
                    .having((t) => t.description, 'description',
                        equals('description'))
                    .having((t) => t.status, 'status', equals(0))
                    .having(
                      (t) => t.startDate,
                      'startDate',
                      equals(
                        DateTime.fromMillisecondsSinceEpoch(1654174800000),
                      ),
                    )
                    .having(
                      (t) => t.endDate,
                      'endDate',
                      equals(
                        DateTime.fromMillisecondsSinceEpoch(1654174800000),
                      ),
                    ),
              ),
            ),
          );
        },
      );
    });

    group('OnTaskUpdateStatue', () {
      blocTest<TaskBloc, TaskState>(
        'Update task status',
        setUp: () {
          when(() => todoUseCase.updateTaskStatus(any(), any()))
              .thenAnswer((_) => Future.value(true));
        },
        build: createBloc,
        act: (bloc) => bloc.add(OnTaskUpdateStatus(testTodo, true)),
        expect: () => [
          const TaskState(isUpdateStatusSuccess: true),
        ],
        verify: (bloc) {
          verify(
            () => todoUseCase.updateTaskStatus(
              any(
                that: isA<Todo>()
                    .having((t) => t.id, 'id', equals('id'))
                    .having((t) => t.title, 'title', equals('title'))
                    .having((t) => t.description, 'description',
                        equals('description'))
                    .having((t) => t.status, 'status', equals(0))
                    .having(
                      (t) => t.startDate,
                      'startDate',
                      equals(
                        DateTime.fromMillisecondsSinceEpoch(1654174800000),
                      ),
                    )
                    .having(
                      (t) => t.endDate,
                      'endDate',
                      equals(
                        DateTime.fromMillisecondsSinceEpoch(1654174800000),
                      ),
                    ),
              ),
              any(),
            ),
          );
        },
      );
    });
  });
}
