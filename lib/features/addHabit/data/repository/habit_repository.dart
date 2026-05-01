import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:hive/hive.dart';

class HabitRepository {

  final Box<HabitModel> box =
      Hive.box<HabitModel>('habits');

  List<HabitModel> getHabits() {
    return box.values.toList();
  }

  void addHabit(HabitModel habit) {
    box.add(habit);
  }

  void deleteHabit(int index) {
    box.deleteAt(index);
  }
}