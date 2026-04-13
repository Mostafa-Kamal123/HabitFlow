import 'package:flutter/material.dart';
import 'package:habit_flow/features/splash/presentation/views/widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SplashBody(),
    );
  }
}