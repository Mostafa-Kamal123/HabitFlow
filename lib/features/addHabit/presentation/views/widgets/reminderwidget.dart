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
    return ListTile(
    title: Text("Reminder",style: TextStyle(color: Colors.black),),
    subtitle: Text(reminderTime.format(context),style: TextStyle(color: Colors.black),),
    trailing: Icon(Icons.arrow_forward_ios),
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