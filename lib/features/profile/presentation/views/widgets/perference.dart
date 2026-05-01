import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_flow/core/controllers/theme_controller.dart';

class Perference extends StatefulWidget {
  Perference({super.key, required this.themeController, required this.notifications});
  ThemeController themeController;
  bool notifications;
  @override
  State<Perference> createState() => _PerferenceState();
}

class _PerferenceState extends State<Perference> {
  @override
  Widget build(BuildContext context) {
    
  return Container(
    margin: EdgeInsets.all(16),
    padding: EdgeInsets.all(16),
    decoration: _cardDecoration(context),
    child: Column(
      children: [
        Obx(() => SwitchListTile(
          title: Text("Dark Mode", style: TextStyle(color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white)),
          value: widget.themeController.isDarkMode.value,
          onChanged: (val) {
            widget.themeController.setDarkMode(val);
          },
        )),
        Divider(
          thickness: 0.1,
        ),
        SwitchListTile(
          title: Text("Notifications", style: TextStyle(color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white)),
          value: widget.notifications,
          onChanged: (val) {
            setState(() => widget.notifications = val);
          },
        ),
      ],
    ),
  );
}
}

BoxDecoration _cardDecoration(BuildContext context) {
  bool isLightTheme = Theme.of(context).brightness == Brightness.light;
  return BoxDecoration(
    color: isLightTheme ? Colors.white.withOpacity(0.85) : const Color(0xFF2A2E3F).withOpacity(0.9),
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        blurRadius: 15,
        color: Colors.black.withOpacity(0.1),
      )
    ],
  );
}
