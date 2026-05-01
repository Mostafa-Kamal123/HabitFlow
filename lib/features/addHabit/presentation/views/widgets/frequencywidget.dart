import 'package:flutter/material.dart';

class FrequencyWidget extends StatefulWidget {
  const FrequencyWidget({super.key, required this.color});
  final Color color;

  @override
  State<FrequencyWidget> createState() => _FrequencyWidgetState();
}

class _FrequencyWidgetState extends State<FrequencyWidget> {
  String frequency = "Daily";
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: ["Daily", "Weekly"].map((e) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                frequency = e;
              });
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: frequency == e ? widget.color : (isLightTheme ? Colors.grey[300] : Colors.grey[700]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(e, style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),)),
            ),
          ),
        );
      }).toList(),
    ),
  );
  }
}