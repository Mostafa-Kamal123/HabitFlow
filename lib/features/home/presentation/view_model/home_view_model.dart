import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/addHabit/data/repository/habit_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HabitRepository repo = HabitRepository();

  List<HabitModel> allHabits = [];
  List<HabitModel> habits = [];

  void loadThreeHabits() {
    allHabits = repo.getHabits();
    habits = allHabits.take(3).toList();
    notifyListeners();
  }

  void loadAllHabits() {
    allHabits = repo.getHabits();
    habits = allHabits.toList();
    notifyListeners();
  }

  void deleteHabit(int index) {
    repo.deleteHabit(index);
    loadAllHabits();
  }

  int completedCount() {
    return allHabits.where((habit) => habit.isCompleted).length;
  }

  double progressPercent() {
    if (allHabits.isEmpty) return 0;
    final totalCurrent = allHabits.fold<int>(0, (sum, habit) => sum + habit.currentCount);
    final totalTarget = allHabits.fold<int>(0, (sum, habit) => sum + habit.targetCount);
    return totalTarget == 0 ? 0 : totalCurrent / totalTarget;
  }

  int bestStreak() {
    if (allHabits.isEmpty) return 0;
    return allHabits.map((habit) => _currentStreak(habit.completedDates)).reduce(max);
  }

  String topHabitName() {
    if (allHabits.isEmpty) return 'No habits yet';
    final sorted = List<HabitModel>.from(allHabits);
    sorted.sort((a, b) => _currentStreak(b.completedDates).compareTo(_currentStreak(a.completedDates)));
    return sorted.first.name;
  }

  List<FlSpot> chartSpots({int days = 7}) {
    final now = DateTime.now();
    final counts = <DateTime, int>{};
    for (final habit in allHabits) {
      for (final date in habit.completedDates) {
        final day = DateTime(date.year, date.month, date.day);
        counts[day] = (counts[day] ?? 1) + 1;
      }
    }

    return List.generate(days, (index) {
      final day = DateTime(now.year, now.month, now.day).subtract(Duration(days: days - index - 1));
      return FlSpot(index.toDouble(), (counts[day] ?? 0).toDouble());
    });
  }

  Map<DateTime, int> heatMapDatasets({int days = 21}) {
    final data = <DateTime, int>{};
    for (final habit in allHabits) {
      for (final date in habit.completedDates) {
        final day = DateTime(date.year, date.month, date.day);
        data[day] = (data[day] ?? 0) + 1;
      }
    }
    return data;
  }

  List<FlSpot> habitChartSpots(HabitModel habit, {int days = 7}) {
    final now = DateTime.now();
    final counts = <DateTime, int>{};
    for (final date in habit.completedDates) {
      final day = DateTime(date.year, date.month, date.day);
      counts[day] = (counts[day] ?? 0) + 1;
    }
    return List.generate(days, (index) {
      final day = DateTime(now.year, now.month, now.day).subtract(Duration(days: days - index - 1));
      return FlSpot(index.toDouble(), (counts[day] ?? 0).toDouble());
    });
  }

  Map<DateTime, int> habitHeatMapDatasets(HabitModel habit, {int days = 21}) {
    final data = <DateTime, int>{};
    for (final date in habit.completedDates) {
      final day = DateTime(date.year, date.month, date.day);
      data[day] = (data[day] ?? 0) + 1;
    }
    return data;
  }

  int habitCurrentStreak(HabitModel habit) {
    return _currentStreak(habit.completedDates);
  }

  double habitCompletionRate(HabitModel habit) {
    if (habit.targetCount == 0) return 0;
    return habit.currentCount / habit.targetCount;
  }

  double completionRate() {
    if (allHabits.isEmpty) return 0;
    return completedCount() / allHabits.length;
  }

  int _currentStreak(List<DateTime> dates) {
    if (dates.isEmpty) return 0;
    final sorted = dates
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));
    var streak = 0;
    var expected = sorted.first;
    for (final date in sorted) {
      if (date == expected) {
        streak++;
        expected = expected.subtract(const Duration(days: 1));
      } else if (date.isBefore(expected)) {
        break;
      }
    }
    return streak;
  }
}
