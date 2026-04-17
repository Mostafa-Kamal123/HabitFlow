import 'package:flutter/material.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/customAppBar.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/custom_home_card.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habitListView.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(height: 30), CustomAppBar(), CustomHomeCard(),
      SizedBox(height: 20,),
      HabitListView(),
      ],
    );
  }
}

