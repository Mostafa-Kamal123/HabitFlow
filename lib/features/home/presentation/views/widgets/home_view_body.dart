import 'package:flutter/material.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/customAppBar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        CustomAppBar(),
      ],
    );
  }
}
