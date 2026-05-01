import 'package:flutter/material.dart';

class Habit {
  String name;
  IconData icon;
  Color color;
  int targetCount;
  int currentCount;
  bool isCompleted;
  String frequency;
  int days;

  Habit({
    required this.name,
    required this.icon,
    required this.color,
    required this.targetCount,
    this.currentCount = 0,
    this.isCompleted = false,
    required this.frequency,
    required this.days,
  });

  Habit copyWith({
    String? name,
    IconData? icon,
    Color? color,
    int? targetCount,
    int? currentCount,
    bool? isCompleted,
    String? frequency,
    int? days,
  }) {
    return Habit(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      targetCount: targetCount ?? this.targetCount,
      currentCount: currentCount ?? this.currentCount,
      isCompleted: isCompleted ?? this.isCompleted,
      frequency: frequency ?? this.frequency,
      days: days ?? this.days,
    );
  }
}
