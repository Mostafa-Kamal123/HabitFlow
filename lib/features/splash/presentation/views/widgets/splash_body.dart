import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:habit_flow/core/utils/assets.dart';
import 'package:habit_flow/features/home/presentation/views/homePage.dart';
import 'package:habit_flow/features/onboard/presentation/views/onboardScreens.dart';
import 'package:habit_flow/features/splash/presentation/views/widgets/slidingText.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState() ;
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidinganimation;
  @override
  void initState(){
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2),(){
      Get.to(()=>onBardScreens(),transition: Transition.fade,duration: const Duration(milliseconds: 250));
    });
  }

  void initSlidingAnimation() {
    animationController=AnimationController(vsync: this,duration:const Duration(seconds: 1));
    slidinganimation=Tween<Offset>(begin: Offset(0, 2),end: Offset.zero).animate(animationController);
    animationController.forward();
  }
  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo, height: 150),
        SlidingText(slidinganimation: slidinganimation),
      ],
    );
  }
}
