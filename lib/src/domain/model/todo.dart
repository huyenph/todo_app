import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  int status;
  @HiveField(4)
  DateTime startDate;
  @HiveField(5)
  DateTime endDate;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          status == other.status;

  @override
  String toString() =>
      '$id - $title - $description - $status - $startDate - $endDate';

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      status.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
}
