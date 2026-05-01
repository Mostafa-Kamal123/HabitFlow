import 'package:flutter/material.dart';

class Habitcard extends StatelessWidget {
  const Habitcard({
    super.key,
    required this.title,
    required this.streakDays,
    required this.iconCode,
    required this.iconColor,
  });

  final String title;
  final String streakDays;
  final int iconCode;
  final int iconColor;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _iconBox(iconCode, iconColor),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, color: isLightTheme ? Colors.black : Colors.white)),
                  Row(
                    children: [
                      const Icon(Icons.local_fire_department, color: Colors.red),
                      Text(' $streakDays', style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
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

Widget _iconBox(int iconCode, int iconColor) {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: Color(iconColor),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Icon(IconData(iconCode, fontFamily: 'MaterialIcons'), color: Colors.white),
  );
}
