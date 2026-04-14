import 'package:flutter/material.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/home_view_body.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
    );
  }
}