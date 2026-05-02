import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/addHabit/presentation/view_model/add_habit_view_model.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/customhabitbar.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/goalwidget.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/habitform.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/frequencywidget.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/savebutton.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/selectcolors.dart';
import 'package:habit_flow/features/addHabit/presentation/views/widgets/selectedIcons.dart';
import 'package:habit_flow/mainl_layout.dart';

class Addhabitbody extends StatefulWidget {
  final HabitModel? habit;
  final int? index;

  Addhabitbody({super.key, this.habit, this.index});

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
  int goalDays = 0;

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
    Colors.blueGrey,
  ];

  @override
  void initState() {
    super.initState();
    if (widget.habit != null) {
      habitName = widget.habit!.name;
      targetCount = widget.habit!.targetCount;
      selectedIcon = icons.indexOf(IconData(widget.habit!.icon, fontFamily: 'MaterialIcons'));
      if (selectedIcon == -1) selectedIcon = 0;
      selectedColor = colors.indexOf(Color(widget.habit!.color));
      if (selectedColor == -1) selectedColor = 0;
      frequency = widget.habit!.frequency;
      goalDays = widget.habit!.days;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomNewHabitBar(
          title: widget.habit != null ? "Edit Habit" : "New Habit",
          onBackPressed: widget.habit != null
              ? () => Navigator.of(context).pop()
              : null,
        ),
        const SizedBox(height: 10),
        HabitForm(
          icon: icons[selectedIcon],
          color: colors[selectedColor],
          targetCount: targetCount,
          initialName: habitName,
          initialDescription: description,
          onTargetCountChanged: (value) {
            setState(() {
              targetCount = value;
            });
          },
          onNameChanged: (value) {
            habitName = value;
          },
          onDescriptionChanged: (value) {
            description = value;
          },
        ),
        SelectedIcons(
          icons: icons,
          selectedIcon: selectedIcon,
          onIconSelected: (index) {
            setState(() {
              selectedIcon = index;
            });
          },
          color: colors[selectedColor],
        ),
        selectcolor(
          colors: colors,
          selectedColor: selectedColor,
          onColorSelected: (index) {
            setState(() {
              selectedColor = index;
            });
          },
        ),
        FrequencyWidget(color: colors[selectedColor]),
        const Goalwidget(),
        Savebutton(
          onPressed: () async {
            if (widget.habit != null && widget.index != null) {
              vm.updateHabit(
                widget.index!,
                habitName,
                icons[selectedIcon].codePoint,
                colors[selectedColor].value,
                targetCount,
                frequency,
                goalDays,
              );
            } else {
              vm.addHabit(
                habitName,
                icons[selectedIcon].codePoint,
                colors[selectedColor].value,
                targetCount,
                frequency,
                goalDays,
                DateTime.now(),
                [],
              );
            }

            await showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: const Text('Habit Saved'),
                  content: const Text('Your habit has been saved successfully.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );

            Get.offAll(
              () => MainlLayout(),
              transition: Transition.fade,
              duration: const Duration(milliseconds: 250),
            );
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
