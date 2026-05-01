import 'package:hive/hive.dart';
part 'habit_model.g.dart';
@HiveType(typeId: 0)
class HabitModel extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  int icon;

  @HiveField(2)
  int color;

  @HiveField(3)
  int targetCount;

  @HiveField(4)
  int currentCount;

  @HiveField(5)
  bool isCompleted;

  @HiveField(6)
  String frequency;

  @HiveField(7)
  int days;

  @HiveField(8)
  DateTime createdAt;

  @HiveField(9)
  List<DateTime> completedDates;

  HabitModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.targetCount,
    this.currentCount = 0,
    this.isCompleted = false,
    required this.frequency,
    required this.days,
    required this.createdAt,
    required this.completedDates
  });
}