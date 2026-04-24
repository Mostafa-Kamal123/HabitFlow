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
    return ListTile(
    title: Text("Goal",style: TextStyle(color: Colors.black),),
    subtitle: Text("$goalDays days",style: TextStyle(color: Colors.black),),
    trailing: Icon(Icons.arrow_forward_ios),
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