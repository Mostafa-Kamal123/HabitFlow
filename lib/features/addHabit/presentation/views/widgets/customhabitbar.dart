
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNewHabitBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomNewHabitBar({
    super.key,
    this.title = "New Habit",
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          if (onBackPressed != null)
            IconButton(
              icon: Icon(Icons.arrow_back, color: isLightTheme ? Colors.black : Colors.white),
              onPressed: onBackPressed,
            ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: isLightTheme ? Colors.black : Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          if (onBackPressed != null)
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}