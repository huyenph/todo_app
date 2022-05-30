import 'package:hive/hive.dart';

part 'todo.g.dart';

enum TodoStatus { complete, incomplete }

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final TodoStatus status;
  @HiveField(3)
  final DateTime startDate;
  @HiveField(4)
  final DateTime endDate;

  Todo({
    required this.title,
    required this.description,
    required this.status,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  @override
  String toString() =>
      '$title - $description - $status - $startDate - $endDate';
}
