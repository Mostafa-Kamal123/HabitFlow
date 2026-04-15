import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/customAppBar.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/custom_home_card.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habitListView.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habit_progress_circle.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(height: 30), CustomAppBar(), CustomHomeCard(),
      
      HabitListView(),
      ],
    );
  }
}

