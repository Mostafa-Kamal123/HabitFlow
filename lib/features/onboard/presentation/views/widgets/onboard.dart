import 'package:flutter/material.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key, required this.tex1, required this.tex2, required this.img});
final String tex1;
final String tex2;
final String img;
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(tex1, style: TextStyle(color: isLightTheme ? Colors.black : Colors.white, fontWeight: FontWeight.bold, fontSize: 34),),
        SizedBox(height: 5,),
        Text(tex2, style: TextStyle(fontSize: 24, color: isLightTheme ? Colors.black : Colors.white),),
        SizedBox(height: 20,),
        ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
    begin: Alignment.center,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
      Colors.white,
      Colors.transparent,
    ],
    stops: [0.0, 0.7, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(
        img,
        width: 400,
        height: 250,
        fit: BoxFit.cover,
      ),
    )
          
      ],
    );
  }
}