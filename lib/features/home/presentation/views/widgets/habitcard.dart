
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_flow/features/home/presentation/views/widgets/habit_progress_circle.dart';

class habitCard extends StatelessWidget {
  const habitCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
        ],
      ),
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    
        leading: FaIcon(FontAwesomeIcons.bookOpenReader,size: 30,color: Colors.green,),
        
        title: Text("Read a book",style: TextStyle(color: Colors.black),),
        subtitle: Row(children: [FaIcon(FontAwesomeIcons.fire,color: Colors.red,size: 15,),Text("15 days")],),
        trailing: SizedBox(
          width: 110,
          height: 70,
          child: Row(children: [
            HabitProgressCircle(current: 2, total: 4),
            SizedBox(width: 5,),
            IconButton(
              onPressed: (){},
              icon: FaIcon(FontAwesomeIcons.circleCheck,size: 35,color: Colors.green,))
            
          ],),
        ),
        
      ),
    );
  }
}
