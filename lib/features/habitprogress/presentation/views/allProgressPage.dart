import 'package:flutter/material.dart';
import 'package:habit_flow/features/habitprogress/presentation/views/progresspage.dart';

class Allprogresspage extends StatelessWidget {
  const Allprogresspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Progresspage(),
    );
  }
}