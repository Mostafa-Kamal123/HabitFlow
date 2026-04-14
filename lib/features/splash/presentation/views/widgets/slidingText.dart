
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidinganimation,
  });

  final Animation<Offset> slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidinganimation,
      builder: (context, _) => 
        SlideTransition(
        position: slidinganimation,
        child: Text(
          "HabitFlow",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
