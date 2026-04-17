
import 'package:flutter/material.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.active});
final bool active;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active?HabitFlowColors.accentSky:Colors.grey
      ),
      width: active?30:10,
      height: 10,
      );
  }
}