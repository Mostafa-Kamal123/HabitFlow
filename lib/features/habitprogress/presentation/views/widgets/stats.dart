import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(child: _statCard("Completion Rate", "89%")),
        SizedBox(width: 10),
        Expanded(child: _statCard("Best Streak", "15 days")),
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
    color: Colors.white.withOpacity(0.8),
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        blurRadius: 20,
        color: Colors.black.withOpacity(0.1),
      )
    ],
  );
}