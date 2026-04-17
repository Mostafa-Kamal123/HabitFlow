import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';
import 'package:habit_flow/features/home/presentation/views/homePage.dart';
import 'package:habit_flow/features/onboard/presentation/views/widgets/customindicator.dart';
import 'package:habit_flow/features/onboard/presentation/views/widgets/onboard.dart';

class onBardScreens extends StatefulWidget {
    const onBardScreens({super.key});

  @override
  State<onBardScreens> createState() => _onBardScreensState();
}

class _onBardScreensState extends State<onBardScreens> {
  PageController pageController=PageController();
  int idx=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: idx<2?Colors.transparent:HabitFlowColors.backgroundLightStart,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 10),
              child: InkWell(
                onTap: () {
                  pageController.animateToPage(idx=2, duration: Duration(milliseconds: 250), curve: Curves.linear);
                },
                child: Text("Skip",style: TextStyle(fontSize: 20),textAlign: TextAlign.right,)),
            ),
        
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    idx=value;
                  });
                },
                controller: pageController,
                children: [
                  Onboard(tex1: "Track your\ndaily habits",tex2: "Easily log and monitor\nyour routines every day",img: "assets/habitflow_assets/onboarding_1_illustration.png",),
                  Onboard(tex1: "Build consistency\n& streaks",tex2: "Stay on track by maintaining\n daily streaks",img: "assets/habitflow_assets/onboarding_2_illustration.png",),
                  Onboard(tex1: "Stay motivated\n& reach your goals",tex2: "Achive more with reminders \nand insights",img: "assets/habitflow_assets/onboarding_3_illustration.png",),
        
                ],
              ),
              
            ),
            SizedBox(height: 90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CustomIndicator(active: idx==0),
              SizedBox(width: 5,),
              CustomIndicator(active: idx==1),
              SizedBox(width: 5,),
              CustomIndicator(active: idx==2),
            ],),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 40,top: 15),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if(idx<2)
                      pageController.animateToPage(idx+1, duration: Duration(milliseconds: 250), curve: Curves.linear);
                    },
                    child: Text(idx<2?"Skip":""),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if(idx<2)
                        pageController.animateToPage(idx + 1, duration: Duration(milliseconds: 250), curve: Curves.linear);
                        else
                        Get.to(()=>Homepage(),transition: Transition.fade,duration: const Duration(milliseconds: 250));

                      });
                    },
                    child: Container(
                      width: idx<2?80:150,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:idx<2? HabitFlowColors.accentPurple:HabitFlowColors.success
                      ),
                      child: Center(child: Text(idx<2?"Next":"Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
