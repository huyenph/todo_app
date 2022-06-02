import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/src/blocs/task/task_bloc.dart';

void main() {
  group('TaskState', () {
    TaskState createState({
      bool? isCreateSuccess,
      bool? isUpdateSuccess,
      bool? isUpdateStatusSuccess,
      bool? isDeleteSuccess,
      String? message,
    }) {
      return TaskState(
        isCreateSuccess: isCreateSuccess,
        isUpdateSuccess: isUpdateSuccess,
        isUpdateStatusSuccess: isUpdateStatusSuccess,
        isDeleteSuccess: isDeleteSuccess,
        message: message,
      );
    }

    test('Values are equality', () {
      expect(createState(), equals(createState()));
    });

    test('Props are correct', () {
      expect(
        createState(
          isCreateSuccess: true,
          isUpdateSuccess: false,
          isUpdateStatusSuccess: true,
          isDeleteSuccess: false,
          message: 'message',
        ).props,
        equals(<Object?>[true, false, true, false, 'message']),
      );
    });

    group('Test copyWith', () {
      test('Returns the same object if not arguments are provided', () {
        expect(
          createState().copyWith(),
          equals(createState()),
        );
      });

      test('Returns the old value if null parameters are provided', () {
        expect(
          createState().copyWith(
            isCreateSuccess: null,
            isUpdateSuccess: null,
            isUpdateStatusSuccess: null,
            isDeleteSuccess: null,
            message: null,
          ),
          equals(createState()),
        );
      });

      test('Replace non-null parameters', () {
        expect(
          createState().copyWith(
            isCreateSuccess: true,
            isUpdateSuccess: false,
            isUpdateStatusSuccess: true,
            isDeleteSuccess: false,
            message: 'message',
          ),
          equals(createState(
            isCreateSuccess: true,
            isUpdateSuccess: false,
            isUpdateStatusSuccess: true,
            isDeleteSuccess: false,
            message: 'message',
          )),
        );
      });
    });
  });
}
