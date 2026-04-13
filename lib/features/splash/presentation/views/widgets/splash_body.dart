import 'package:flutter/material.dart';
import 'package:habit_flow/core/utils/assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo,height: 150,),
        Center(child: Text("HabitFlow",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),))
      ],
    );
  }
}