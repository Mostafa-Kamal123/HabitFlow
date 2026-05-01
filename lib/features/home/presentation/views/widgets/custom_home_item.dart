
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomhomeItem extends StatelessWidget {
  const CustomhomeItem({
    super.key,
    required this.tex1,
    required this.tex2,
    required this.icon,
    required this.colorIcon,
  });
  final String tex1;
  final String tex2;
  final FaIconData icon;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return Row(
      children: [
        FaIcon(icon, color: colorIcon, size: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20),
          child: Column(children: [
            Text(tex1, style: TextStyle(color: isLightTheme ? Colors.black : Colors.white)),
            Text(tex2, style: TextStyle(color: isLightTheme ? Colors.black : Colors.white))
          ]),
        ),
      ],
    );
  }
}
