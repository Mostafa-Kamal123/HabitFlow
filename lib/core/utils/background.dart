import 'package:flutter/material.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isLightTheme 
            ? HabitFlowColors.backgroundGradient
            : HabitFlowColors.darkBackgroundGradient,
        ),
      ),
      child: child,
    );
  }
}