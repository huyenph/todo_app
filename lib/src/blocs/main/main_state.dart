part of 'main_cubit.dart';
enum MainTab { all, complete, incomplete }

class MainState extends Equatable {
  final MainTab tab;

  const MainState({this.tab = MainTab.all});

  @override
  List<Object?> get props => [tab];
}
