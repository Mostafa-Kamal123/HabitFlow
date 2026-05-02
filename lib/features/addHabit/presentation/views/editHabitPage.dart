import 'package:flutter/material.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/addHabitbody.dart';

class EditHabitPage extends StatelessWidget {
  final HabitModel habit;
  final int index;

  const EditHabitPage({super.key, required this.habit, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Addhabitbody(habit: habit, index: index),
    );
  }
}