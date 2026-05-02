import 'package:flutter/material.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/widgets/calenderheatmap.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/widgets/chartwidget.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/widgets/habitcard.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/widgets/stats.dart';
import 'package:habit_flow/features/home/presentation/view_model/home_view_model.dart';

class Progresspage extends StatefulWidget {
  const Progresspage({super.key});

  @override
  State<Progresspage> createState() => _ProgresspageState();
}

class _ProgresspageState extends State<Progresspage> {
  late HomeViewModel vm;
  int selectedHabitIndex = 0;

  @override
  void initState() {
    super.initState();
    vm = HomeViewModel();
    vm.loadAllHabits();
  }

  HabitModel? get selectedHabit {
    if (vm.allHabits.isEmpty) return null;
    if (selectedHabitIndex < 0 || selectedHabitIndex >= vm.allHabits.length) {
      return vm.allHabits.first;
    }
    return vm.allHabits[selectedHabitIndex];
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    final habit = selectedHabit;
    final streakText = habit == null ? '0 days' : '${vm.habitCurrentStreak(habit)} day${vm.habitCurrentStreak(habit) == 1 ? '' : 's'}';
    final completionRate = habit == null ? '0%' : '${(vm.habitCompletionRate(habit) * 100).round()}%';
    final title = habit?.name ?? 'No habit selected';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Progress",
                  style: TextStyle(
                    color: isLightTheme ? Colors.black : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (vm.allHabits.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: DropdownButton<int>(
                    value: selectedHabitIndex,
                    isExpanded: true,
                    items: vm.allHabits.asMap().entries.map((entry) {
                      return DropdownMenuItem<int>(
                        value: entry.key,
                        child: Text(entry.value.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedHabitIndex = value;
                        });
                      }
                    },
                  ),
                ),
              Habitcard(
                title: title,
                streakDays: streakText,
                iconCode: habit?.icon ?? Icons.menu_book.codePoint,
                iconColor: habit?.color ?? 0xFF4CAF50,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "Habit Chart",
                  style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),
                ),
              ),
              Chartwidget(spots: habit == null ? [] : vm.habitChartSpots(habit)),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "Calendar",
                  style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),
                ),
              ),
              Calenderheatmap(datasets: habit == null ? {} : vm.habitHeatMapDatasets(habit)),
              Stats(completionRate: completionRate, bestStreak: streakText),
            ],
          ),
        ),
      ),
    );
  }
}