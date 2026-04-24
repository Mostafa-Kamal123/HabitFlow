import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';
import 'package:habit_flow/features/addHabit/presentation/views/addHabitPage.dart';
import 'package:habit_flow/features/home/presentation/views/homePage.dart';

class MainlLayout extends StatefulWidget {
  const MainlLayout({super.key});

  @override
  State<MainlLayout> createState() => _MainlLayoutState();
}

class _MainlLayoutState extends State<MainlLayout> {
int idx=0;
final List<Widget> pages=[
  Homepage(),
  AddHabitpage(),
  FaIcon(FontAwesomeIcons.person)
];
final List<Widget> elements=[
  FaIcon(FontAwesomeIcons.house),
  FaIcon(FontAwesomeIcons.plus),
  FaIcon(FontAwesomeIcons.personRifle)
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: pages[idx],
      bottomNavigationBar:CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 700),
        buttonBackgroundColor: HabitFlowColors.primaryBlue,
        height: 70,
        index: idx,
        backgroundColor: Colors.transparent,
        items: elements,
        onTap: (value) {
          setState(() {
            idx=value;
          });
        },
      
      ) ,
    );
  }
}