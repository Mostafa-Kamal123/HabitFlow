import 'package:flutter/material.dart';

class Savebutton extends StatelessWidget {
  const Savebutton({super.key, required this.onPressed});
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(16),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text("Save"),
    ),
  );
  }
}