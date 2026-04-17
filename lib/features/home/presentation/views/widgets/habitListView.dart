
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habitcard.dart';

class HabitListView extends StatelessWidget {
  const HabitListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      const Text("Today's Habits",style: TextStyle(color: Colors.black),),
      TextButton(onPressed: (){}, child: const Row(
        
        children: [
          Text("See All",style: TextStyle(color: Colors.grey),),
          SizedBox(width: 5,),
          FaIcon(FontAwesomeIcons.arrowRight,color: Colors.grey,)
      ],))
    ],),
        ),
        habitCard(),
        habitCard(),
        habitCard(),
        habitCard(),
      ],
      
    );
  }
}