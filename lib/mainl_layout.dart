import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';
import 'package:habit_flow/features/addHabit/presentation/views/addHabitPage.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/allProgressPage.dart';
import 'package:habit_flow/features/home/presentation/views/homePage.dart';
import 'package:habit_flow/features/profile/presentation/views/profilepage.dart';

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
  Allprogresspage(),
  ProfilePage()
];

  List<Widget> getElements(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    Color iconColor = isLightTheme ? Colors.black : Colors.white;
    
    return [
      FaIcon(FontAwesomeIcons.house, color: iconColor),
      FaIcon(FontAwesomeIcons.plus, color: iconColor),
      FaIcon(FontAwesomeIcons.chartLine, color: iconColor),
      FaIcon(FontAwesomeIcons.user, color: iconColor)
    ];
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: pages[idx],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 700),
        buttonBackgroundColor: HabitFlowColors.primaryBlue,
        height: 70,
        index: idx,
        color: isLightTheme 
          ? const Color(0xFFF5F5FA).withOpacity(0.95)
          : const Color(0xFF2A2E3F).withOpacity(0.95),
        backgroundColor: Colors.transparent,
        items: getElements(context),
        onTap: (value) {
          setState(() {
            idx=value;
          });
        },
      ) ,
    );
  }
}