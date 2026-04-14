
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String today =DateFormat('EEEE, dd MMM yyyy').format(DateTime.now());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good Morning ,Mostafa",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(height: 5,),
                Text(today)
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50)
            ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.person,size: 40,))),
      ],),
    );
  }
}