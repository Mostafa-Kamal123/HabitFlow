import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:habit_flow/core/services/hiveService.dart';
import 'package:habit_flow/core/utils/HabitFlowTheme.dart';
import 'package:habit_flow/core/utils/background.dart';
import 'package:habit_flow/features/splash/presentation/views/splash_screen.dart';
import 'package:habit_flow/core/controllers/theme_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();
  Get.put(ThemeController());
  runApp(const HabitFlow());
}

class HabitFlow extends StatelessWidget {
  const HabitFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    
    return Obx(() => GetMaterialApp(
      
      builder:(context, child) {
        return AppBackground(child: child!);
      },
      debugShowCheckedModeBanner: false,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: HabitFlowTheme.lightTheme.copyWith(scaffoldBackgroundColor: Colors.transparent),
      darkTheme: HabitFlowTheme.darkTheme.copyWith(scaffoldBackgroundColor: Colors.transparent),
      home: SplashScreen(),
    ));
}
}