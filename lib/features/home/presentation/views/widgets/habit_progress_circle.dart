import 'package:flutter/material.dart';

class HabitProgressCircle extends StatelessWidget {
  final int current;
  final int total;
  final double size;

  const HabitProgressCircle({
    super.key,
    required this.current,
    required this.total,
    this.size = 45,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = total == 0 ? 0 : current / total;

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
              value: progress,
              strokeWidth: 7,
              backgroundColor: const Color(0xFFE9ECF5),
              valueColor: const AlwaysStoppedAnimation(
                Color(0xFF63D1D8),
              ),
            ),
          ),
          Text(
            '$current/$total',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3C7E8D),
            ),
          ),
        ],
      ),
    );
  }
}