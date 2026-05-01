import 'package:flutter/material.dart';

class Aboutsection extends StatelessWidget {
  const Aboutsection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
  return Container(
    margin: EdgeInsets.all(16),
    decoration: _cardDecoration(context),
    child: Column(
      children: [
        ListTile(
          title: Text("About", style: TextStyle(color: isLightTheme ? Colors.black : Colors.white)),
          trailing: Icon(Icons.arrow_forward_ios, color: isLightTheme ? Colors.black : Colors.white)
        ),
        Divider(
          thickness: 0.1,
        ),
        ListTile(
          title: Text("Help & Support", style: TextStyle(color: isLightTheme ? Colors.black : Colors.white)),
        ),
        Divider(thickness: 0.1,),
        ListTile(
          title: Text("Give Feedback", style: TextStyle(color: isLightTheme ? Colors.black : Colors.white)),
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