import 'package:flutter/material.dart';

class Reminderwidget extends StatefulWidget {
  const Reminderwidget({super.key});

  @override
  State<Reminderwidget> createState() => _ReminderwidgetState();
}

class _ReminderwidgetState extends State<Reminderwidget> {
  TimeOfDay reminderTime = TimeOfDay(hour: 8, minute: 0);
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return ListTile(
    title: Text("Reminder", style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),),
    subtitle: Text(reminderTime.format(context), style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),),
    trailing: Icon(Icons.arrow_forward_ios, color: isLightTheme ? Colors.black : Colors.white),
    onTap: () async {
      TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: reminderTime,
      );
      if (picked != null) {
        setState(() {
          reminderTime = picked;
        });
      }
    },
  );
  }
}