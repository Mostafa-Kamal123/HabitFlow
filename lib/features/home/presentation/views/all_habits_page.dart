import 'package:flutter/material.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/home/presentation/view_model/home_view_model.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habit_list_view.dart';

class AllHabitsPage extends StatefulWidget {
  const AllHabitsPage({super.key});

  @override
  State<AllHabitsPage> createState() => _AllHabitsPageState();
}

class _AllHabitsPageState extends State<AllHabitsPage> {
  late HomeViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = HomeViewModel();
    vm.loadAllHabits();
  }

  void _updateHabit(int index, HabitModel habit) {
    setState(() {
      vm.habits[index] = habit;
      habit.save();
    });
  }

  void _deleteHabit(int index) {
    setState(() {
      vm.habits.removeAt(index);
      vm.deleteHabit(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Habits'),
        centerTitle: true,
      ),
      body: HabitListView(
        habits: vm.habits,
        onHabitUpdated: _updateHabit,
        onHabitDeleted: _deleteHabit,
        showHeader: false,
      ),
    );
  }
}
