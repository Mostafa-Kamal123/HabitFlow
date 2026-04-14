import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:habit_flow/core/utils/HabitFlowTheme.dart';
import 'package:habit_flow/core/utils/background.dart';
import 'package:habit_flow/features/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const HabitFlow());
}

class HabitFlow extends StatelessWidget {
  const HabitFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder:(context, child) {
        return AppBackground(child: child!);
      },
      debugShowCheckedModeBanner: false,
      theme: HabitFlowTheme.lightTheme.copyWith(scaffoldBackgroundColor: Colors.transparent),
      darkTheme: HabitFlowTheme.darkTheme,
      home: SplashScreen(),
    );
}
}