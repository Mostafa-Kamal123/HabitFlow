import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/custom_home_item.dart';

class CustomHomeCard extends StatelessWidget {
  const CustomHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomhomeItem(
              tex1: "15 day",
              tex2: "Streak",
              icon: FontAwesomeIcons.fire,
              colorIcon: Colors.red,
            ),

            Container(width: 1, height: 50, color: Colors.grey.shade300),
            CustomhomeItem(
              tex1: "3/5",
              tex2: "Completed",
              icon: FontAwesomeIcons.circleCheck,
              colorIcon: Colors.green,
            ),

            Container(width: 1, height: 50, color: Colors.grey.shade300),
            CustomhomeItem(
              tex1: "50%",
              tex2: "Progress",
              icon: FontAwesomeIcons.circleHalfStroke,
              colorIcon: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
