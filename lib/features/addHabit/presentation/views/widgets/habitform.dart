
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';

class HabitForm extends StatefulWidget {
    HabitForm({
    super.key, required this.icon, required this.color,
  });
  IconData icon;

final Color color;
  @override
  State<HabitForm> createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  String habitnam='';
String description='';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 5),
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Icon(widget.icon,size: 35,color: Colors.white,)),
            ),
          
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              children: [
                TextField(
                      decoration: InputDecoration(labelText: "Habit Name"),
                      onChanged: (value){
                        setState(() {
                          habitnam=value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(labelText: "Description"),
                      onChanged: (value) {
                        description=value;
                      }
                    ),
                
              ],
            ),
          )
          ],
        )
      ],
    ),
    );
  }
}
