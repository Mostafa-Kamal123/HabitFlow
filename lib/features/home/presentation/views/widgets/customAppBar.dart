
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.userName,
    required this.userAvatar,
  });

  final String userName;
  final String userAvatar;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    final hour = DateTime.now().hour;
    final greeting = hour < 12 ? 'Good morning' : hour < 18 ? 'Good afternoon' : 'Good evening';
    String today = DateFormat('EEEE, dd MMM yyyy').format(DateTime.now());
    final displayName = userName.isEmpty ? 'User' : userName;
    
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
                Text('$greeting, $displayName', style: TextStyle(fontSize: 20, color: isLightTheme ? Colors.black : Colors.white),),
                const SizedBox(height: 5,),
                Text(today, style: TextStyle(color: isLightTheme ? Colors.black : Colors.white))
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            
            decoration: BoxDecoration(
              color: isLightTheme ? Colors.white : const Color(0xFF2A2E3F),
              borderRadius: BorderRadius.circular(50)
            ),
            child: CircleAvatar(
              backgroundColor: isLightTheme ? Colors.white : const Color(0xFF2A2E3F),
              backgroundImage: AssetImage(userAvatar),
            )),
      ],),
    );
  }
}