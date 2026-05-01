import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({
    super.key,
    required this.completionRate,
    required this.bestStreak,
  });

  final String completionRate;
  final String bestStreak;

  @override
  Widget build(BuildContext context) {
    
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(child: _statCard("Completion Rate", completionRate)),
        const SizedBox(width: 10),
        Expanded(child: _statCard("Best Streak", bestStreak)),
      ],
    ),
  );

  }
}
Widget _statCard(String title, String value) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: _cardDecoration(),
    child: Column(
      children: [
        Text(title),
        SizedBox(height: 10),
        Text(value, style: TextStyle(fontSize: 24)),
      ],
    ),
  );
}
BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: const Color.fromRGBO(255, 255, 255, 0.8),
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        blurRadius: 20,
        color: const Color.fromRGBO(0, 0, 0, 0.1),
      )
    ],
  );
}