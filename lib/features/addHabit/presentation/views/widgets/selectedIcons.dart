
import 'package:flutter/material.dart';

class SelectedIcons extends StatefulWidget {
    SelectedIcons({
    super.key,
    required this.icons,
    required this.selectedIcon, required this.onIconSelected, required this.color,
  });
  final Function(int) onIconSelected;

  final List<IconData> icons;
  int selectedIcon;
  final Color color;

  @override
  State<SelectedIcons> createState() => _SelectedIconsState();
}

class _SelectedIconsState extends State<SelectedIcons> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
    padding: const EdgeInsets.all(16),
    child: Text("Icon",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          SizedBox(
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.icons.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            widget.onIconSelected(index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.selectedIcon == index
                  ? widget.color.withOpacity(0.2)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(widget.icons[index]),
          ),
        );
      },
    ),
          )
        ],
      );
  }
}
