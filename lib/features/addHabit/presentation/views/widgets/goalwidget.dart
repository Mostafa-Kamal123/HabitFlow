import 'package:flutter/material.dart';

class Goalwidget extends StatefulWidget {
  const Goalwidget({super.key});

  @override
  State<Goalwidget> createState() => _GoalwidgetState();
}

class _GoalwidgetState extends State<Goalwidget> {
  int goalDays = 30;
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return ListTile(
    title: Text("Goal", style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),),
    subtitle: Text("$goalDays days", style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),),
    trailing: Icon(Icons.arrow_forward_ios, color: isLightTheme ? Colors.black : Colors.white),
    onTap: () async {
      int? result = await showDialog(
        context: context,
        builder: (_) {
          int temp = goalDays;
          return AlertDialog(
            title: Text("Select Days"),
            content: TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) => temp = int.parse(val),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, temp),
                child: Text("OK"),
              )
            ],
          );
        },
      );

      if (result != null) {
        setState(() {
          goalDays = result;
        });
      }
    },
  );
  }
}