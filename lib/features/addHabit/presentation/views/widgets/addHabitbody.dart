import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/customhabitbar.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/goalwidget.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/habitform.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/frequencywidget.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/reminderwidget.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/savebutton.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/selectcolors.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/selectedIcons.dart';

class Addhabitbody extends StatefulWidget {
  Addhabitbody({super.key});

  @override
  State<Addhabitbody> createState() => _AddhabitbodyState();
}

class _AddhabitbodyState extends State<Addhabitbody> {
  String habitName = "";
  String description = "";

  int selectedIcon = 0;
  int selectedColor = 0;
  String frequency = "Daily";

  TimeOfDay reminderTime = TimeOfDay(hour: 8, minute: 0);
  int goalDays = 30;
final List<IconData> icons = [
    Icons.menu_book,
    Icons.fitness_center,
    Icons.apple,
    Icons.nightlight,
    Icons.spa,
    Icons.lightbulb,
    Icons.sunny,
  ];
  
final List<Color> colors = [
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.orange,
    Colors.blueGrey
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30,),
        CustomNewHabitBar(),
        SizedBox(height: 10,),
        HabitForm(icon: icons[selectedIcon],color: colors[selectedColor],),
        SelectedIcons(icons: icons, selectedIcon: selectedIcon,onIconSelected: (index) {
          setState(() {
            selectedIcon=index;
          });
        }
        ,color: colors[selectedColor],),
        // SizedBox(height: 10,),
        selectcolor(colors: colors, selectedColor: selectedColor,onColorSelected: (index) {
          setState(() {
            selectedColor=index;
          });
        },),
        // SizedBox(height: 10,),
        FrequencyWidget(),
        // SizedBox(height: 10,),
        Reminderwidget(),
        Goalwidget(),
        Savebutton(),
        SizedBox(height: 30,)
      ],
    );

  }
}
