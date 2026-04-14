import 'package:flutter/material.dart';
import 'package:habit_flow/core/utils/assets.dart';
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
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 1));
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
