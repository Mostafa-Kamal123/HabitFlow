import 'package:flutter/material.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/addHabit/data/repository/habit_repository.dart';

class AddHabitViewModel extends ChangeNotifier {
  final repo = HabitRepository();

  void addHabit(String name, int icon, int color,int targetCount,String frequency,int days,DateTime createdAt,List<DateTime> completedDates) {
    final habit = HabitModel(
      name: name,
      icon: icon,
      color: color,
      
      targetCount: targetCount, frequency: frequency, days: days, createdAt: createdAt, completedDates: completedDates,
    );

    repo.addHabit(habit);
  }
}