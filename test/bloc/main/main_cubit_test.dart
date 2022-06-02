import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/src/blocs/main/main_cubit.dart';

void main() {
  group('MainCubit', () {
    MainCubit buildCubit() => MainCubit();

    group('Constructor', () {
      test('Work properly', () {
        expect(buildCubit, returnsNormally);
      });

      test('Correct initial state', () {
        expect(
          buildCubit().state,
          equals(const MainState()),
        );
      });
    });

    group('Test set tab', () {
      blocTest<MainCubit, MainState>(
        'Set tab',
        build: buildCubit,
        act: (cubit) => cubit.setTab(MainTab.all),
        expect: () => [
          const MainState(tab: MainTab.all),
        ],
      );
    });
  });
}
