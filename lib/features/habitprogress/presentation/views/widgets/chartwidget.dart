import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chartwidget extends StatelessWidget {
  const Chartwidget({super.key});

  @override
  Widget build(BuildContext context) {
    
  return Container(
    margin: EdgeInsets.all(16),
    padding: EdgeInsets.all(16),
    decoration: _cardDecoration(),
    height: 200,
    child: LineChart(
      LineChartData(
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: [
              FlSpot(0, 2),
              FlSpot(1, 4),
              FlSpot(2, 3),
              FlSpot(3, 6),
              FlSpot(4, 5),
              FlSpot(5, 8),
            ],
          )
        ],
      ),
    ),
  );

  }
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