import 'package:flutter/material.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/home/presentation/view_model/home_view_model.dart';
import 'package:habit_flow/features/home/presentation/views/all_habits_page.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/customAppBar.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/custom_home_card.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habit_list_view.dart';
import 'package:habit_flow/features/profile/data/repository/user_repository.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late HomeViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = HomeViewModel();
    vm.loadAllHabits();
    vm.loadThreeHabits();
  }

  void _updateHabit(int index, HabitModel habit) {
    setState(() {
      vm.habits[index] = habit;
    });
  }

  void _deleteHabit(int index) {
    setState(() {
      vm.deleteHabit(index);
      vm.loadThreeHabits();
    });
  }

  void _openAllHabitsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AllHabitsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = UserRepository().getUser();
    final userName = user?.name ?? 'User';
    final userAvatar = user?.avatar ?? 'assets/avatars/avatar_1.jpg';
    final streakText = '${vm.bestStreak()} day${vm.bestStreak() == 1 ? '' : 's'}';
    final completedText = '${vm.completedCount()}/${vm.allHabits.length}';
    final progressText = '${(vm.progressPercent() * 100).round()}%';

    return Column(
      children: [
        const SizedBox(height: 30),
        CustomAppBar(userName: userName, userAvatar: userAvatar),
        CustomHomeCard(
          streakText: streakText,
          completedText: completedText,
          progressText: progressText,
        ),
        const SizedBox(height: 20),
        HabitListView(
          habits: vm.habits,
          onHabitUpdated: _updateHabit,
          onHabitDeleted: _deleteHabit,
          onSeeAll: _openAllHabitsPage,
        ),
      ],
    );
  }
}

