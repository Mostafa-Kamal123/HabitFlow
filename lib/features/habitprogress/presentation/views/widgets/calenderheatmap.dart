import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class Calenderheatmap extends StatelessWidget {
  const Calenderheatmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    margin: EdgeInsets.all(16),
    padding: EdgeInsets.all(16),
    decoration: _cardDecoration(),
    child: HeatMap(
      size: 15,
      startDate: DateTime.now().subtract(Duration(days: 21)),
      endDate: DateTime.now(),
      datasets: {
        DateTime(2026, 4, 1): 1,
        DateTime(2026, 4, 2): 3,
        DateTime(2026, 4, 3): 2,
      },
      colorMode: ColorMode.opacity,
      showColorTip: false, colorsets: {
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