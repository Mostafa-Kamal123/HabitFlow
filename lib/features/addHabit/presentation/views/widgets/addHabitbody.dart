import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:habit_flow/core/models/habit_model.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/addHabit/presentation/view_model/add_habit_view_model.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/customhabitbar.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/goalwidget.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/habitform.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/frequencywidget.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/reminderwidget.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/savebutton.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/selectcolors.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/selectedIcons.dart';
import 'package:habit_flow/mainl_layout.dart';

class Addhabitbody extends StatefulWidget {
  Addhabitbody({super.key});

  @override
  State<Addhabitbody> createState() => _AddhabitbodyState();
}

class _AddhabitbodyState extends State<Addhabitbody> {
  final vm = AddHabitViewModel();
  String habitName = "";
  String description = "";
  int targetCount = 1;

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
    return ListView(
      
      children: [
        
        CustomNewHabitBar(),
        SizedBox(height: 10,),
        HabitForm(
          icon: icons[selectedIcon],
          color: colors[selectedColor],
          targetCount: targetCount,
          onTargetCountChanged: (value) {
            setState(() {
              targetCount = value;
            });
          }, onNameChanged: (value) {habitName=value;  }, onDescriptionChanged: (value) { description=value; },
        ),
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
        FrequencyWidget(color: colors[selectedColor],),
        // SizedBox(height: 10,),
        
        
          
            Goalwidget(),
          
        
        Savebutton(
  onPressed: () {

    vm.addHabit(habitName, icons[selectedIcon].codePoint, colors[selectedColor].value, targetCount, frequency, goalDays
    ,DateTime.now(),[]
    );

  Get.to(()=>MainlLayout(),transition: Transition.fade,duration: const Duration(milliseconds: 250));
  },
),
        SizedBox(height: 30,)
      ],
    );

  }
}
