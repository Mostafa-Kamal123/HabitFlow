import 'package:flutter/material.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/widgets/calenderheatmap.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/widgets/chartwidget.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/widgets/habitcard.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/widgets/stats.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habitcard.dart';

class Progresspage extends StatelessWidget {
  const Progresspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Center(child: Text("Progress",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
            Habitcard(),
            SizedBox(height: 10,),
            Chartwidget(),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("Calender for 21 days"),
            ),
            Calenderheatmap(),
            Stats()
          ],
        ),
      )),
    );
  }
}