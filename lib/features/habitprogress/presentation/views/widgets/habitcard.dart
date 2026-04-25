import 'package:flutter/material.dart';

class Habitcard extends StatefulWidget {
  const Habitcard({super.key});

  @override
  State<Habitcard> createState() => _HabitcardState();
}

class _HabitcardState extends State<Habitcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.all(16),
    padding: EdgeInsets.all(16),
    decoration: _cardDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _iconBox(),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Read a Book", style: TextStyle(fontSize: 18,color: Colors.black)),
                Row(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.red),
                    Text(" 15 days",style: TextStyle(color: Colors.black),),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: 16),
        _tabs(),
      ],
    ),
  );
  }
}
BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white.withOpacity(0.8),
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        blurRadius: 20,
        color: Colors.black.withOpacity(0.1),
      )
    ],
  );
}

Widget _iconBox() {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Icon(Icons.menu_book, color: Colors.white),
  );
}
Widget _tabs() {
  return Row(
    children: ["Weekly", "Monthly"].map((e) {
      bool selected = e == "Weekly";
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: selected ? Colors.green : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: Text(e , style: TextStyle(color: Colors.black),)),
        ),
      );
    }).toList(),
  );
}