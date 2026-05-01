
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNewHabitBar extends StatelessWidget {
  const CustomNewHabitBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return Center(child: Text("New Habit", style: TextStyle(color: isLightTheme ? Colors.black : Colors.white, fontSize: 24),));
  }
}