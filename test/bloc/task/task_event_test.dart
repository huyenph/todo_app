import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/src/blocs/task/task_bloc.dart';
import 'package:todo_app/src/domain/model/todo.dart';

void main() {
  group('TaskEventTest', () {
    group('OnDateChangedTest', () {
      test('Values are equality', () {
        expect(
          OnDateChanged(
            DateTime.fromMillisecondsSinceEpoch(1654174800000),
            true,
          ),
          equals(OnDateChanged(
            DateTime.fromMillisecondsSinceEpoch(1654174800000),
            true,
          )),
        );
      });

      test('Props are correct', () {
        expect(
          OnDateChanged(
            DateTime.fromMillisecondsSinceEpoch(1654174800000),
            true,
          ).props,
          equals(<Object?>[
            DateTime.fromMillisecondsSinceEpoch(1654174800000),
            true,
          ]),
        );
      });
    });

    group('OnTaskCreatedTest', () {
      test('Values are equality', () {
        expect(
          OnTaskCreated(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          ),
          equals(OnTaskCreated(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          )),
        );
      });

      test('Props are correct', () {
        expect(
          OnTaskCreated(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          ).props,
          equals(
            <Object?>[
              Todo(
                id: 'id',
                title: 'title',
                description: 'description',
                status: 0,
                startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
                endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
              ),
            ],
          ),
        );
      });
    });

    group('OnTaskUpdatedTest', () {
      test('Values are equality', () {
        expect(
          OnTaskUpdated(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          ),
          equals(OnTaskUpdated(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          )),
        );
      });

      test('Props are correct', () {
        expect(
          OnTaskUpdated(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          ).props,
          equals(
            <Object?>[
              Todo(
                id: 'id',
                title: 'title',
                description: 'description',
                status: 0,
                startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
                endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
              ),
            ],
          ),
        );
      });
    });

    group('OnTaskUpdateStatusTest', () {
      test('Values are equality', () {
        expect(
          OnTaskUpdateStatus(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
            true,
          ),
          equals(OnTaskUpdateStatus(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
            true,
          )),
        );
      });

      test('Props are correct', () {
        expect(
          OnTaskUpdateStatus(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
            false,
          ).props,
          equals(
            <Object?>[
              Todo(
                id: 'id',
                title: 'title',
                description: 'description',
                status: 0,
                startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
                endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
              ),
              false,
            ],
          ),
        );
      });
    });

    group('OnTaskDeletedTest', () {
      test('Values are equality', () {
        expect(
          OnTaskDeleted(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          ),
          equals(OnTaskDeleted(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          )),
        );
      });

      test('Props are correct', () {
        expect(
          OnTaskDeleted(
            Todo(
              id: 'id',
              title: 'title',
              description: 'description',
              status: 0,
              startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
              endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
            ),
          ).props,
          equals(
            <Object?>[
              Todo(
                id: 'id',
                title: 'title',
                description: 'description',
                status: 0,
                startDate: DateTime.fromMillisecondsSinceEpoch(1654174800000),
                endDate: DateTime.fromMillisecondsSinceEpoch(1654261200000),
              ),
            ],
          ),
        );
      });
    });
  });
}
