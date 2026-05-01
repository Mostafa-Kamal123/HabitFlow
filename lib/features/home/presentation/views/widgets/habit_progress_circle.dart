import 'package:flutter/material.dart';

class HabitProgressCircle extends StatelessWidget {
  final int current;
  final int total;
  final bool isCompleted;
  final double size;

  const HabitProgressCircle({
    super.key,
    required this.current,
    required this.total,
    this.isCompleted = false,
    this.size = 45,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = total == 0 ? 0 : current / total;
    final Color progressColor = isCompleted ? Colors.green : const Color(0xFF63D1D8);
    final Color backgroundColor = Theme.of(context).brightness == Brightness.light
        ? const Color(0xFFE9ECF5)
        : const Color(0xFF3A3E4F);
    final Color textColor = isCompleted ? Colors.green : Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              strokeWidth: 7,
              backgroundColor: backgroundColor,
              valueColor: AlwaysStoppedAnimation(progressColor),
            ),
          ),
          Text(
            '$current/$total',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
