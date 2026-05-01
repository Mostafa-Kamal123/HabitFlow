import 'package:flutter/material.dart';

class CountWidget extends StatefulWidget {
  const CountWidget({super.key, required this.onCountChanged});
  final Function(int) onCountChanged;

  @override
  State<CountWidget> createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return ListTile(
      title: Text(
        "Daily Target Count",
        style: TextStyle(
          color: isLightTheme ? Colors.black : Colors.white,
        ),
      ),
      subtitle: Text(
        "$count times/pages/units",
        style: TextStyle(
          color: isLightTheme ? Colors.black : Colors.white,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (count > 1) {
                setState(() {
                  count--;
                });
                widget.onCountChanged(count);
              }
            },
            icon: Icon(Icons.remove, color: isLightTheme ? Colors.black : Colors.white),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isLightTheme ? Colors.grey[200] : Colors.grey[700],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isLightTheme ? Colors.black : Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                count++;
              });
              widget.onCountChanged(count);
            },
            icon: Icon(Icons.add, color: isLightTheme ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}
