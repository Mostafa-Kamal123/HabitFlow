import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class Calenderheatmap extends StatelessWidget {
  const Calenderheatmap({
    super.key,
    required this.datasets,
  });

  final Map<DateTime, int> datasets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(context),
      child: HeatMap(
        size: 15,
        startDate: DateTime.now().subtract(const Duration(days: 21)),
        endDate: DateTime.now(),
        datasets: datasets,
        colorMode: ColorMode.opacity,
        showColorTip: false,
        colorsets: {
          1: Colors.red,
          3: Colors.orange,
          5: Colors.yellow,
          7: Colors.green,
          9: Colors.blue,
          11: Colors.indigo,
          13: Colors.purple,
        },
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