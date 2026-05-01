import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chartwidget extends StatelessWidget {
  const Chartwidget({
    super.key,
    required this.spots,
  });

  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(context),
      height: 200,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: spots,
              color: isLightTheme ? Colors.blue : Colors.green,
              barWidth: 3,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration(BuildContext context) {
  bool isLightTheme = Theme.of(context).brightness == Brightness.light;
  return BoxDecoration(
    color: isLightTheme ? const Color.fromRGBO(255, 255, 255, 0.8) : const Color(0xFF2A2E3F).withAlpha(230),
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        blurRadius: 20,
        color: const Color.fromRGBO(0, 0, 0, 0.1),
      )
    ],
  );
}
