import 'package:flutter/material.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: HabitFlowColors.backgroundGradient,
        ),
      ),
      child: child,
    );
  }
}