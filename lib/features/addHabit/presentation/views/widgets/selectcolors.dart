
import 'package:flutter/material.dart';

class selectcolor extends StatefulWidget {
  const selectcolor({
    super.key,
    required this.colors,
    required this.selectedColor, required this.onColorSelected,
  });
final Function(int) onColorSelected;
  final List<Color> colors;
  final int selectedColor;

  @override
  State<selectcolor> createState() => _selectcolorState();
}

class _selectcolorState extends State<selectcolor> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
    padding: const EdgeInsets.all(16),
    child: Text("Color",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
          ),
          SizedBox(
    height: 60,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.colors.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            widget.onColorSelected(index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 40,
            decoration: BoxDecoration(
              color: widget.colors[index],
              shape: BoxShape.circle,
              border: widget.selectedColor == index
                  ? Border.all(width: 3, color: Colors.black)
                  : null,
            ),
          ),
        );
      },
    ),
          )
        ],
      );
  }
}
