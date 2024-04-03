import 'package:flutter/material.dart';

import '../res/colors.dart';

class AuthH1Sub extends StatelessWidget {
  final String h1;
  final String sub;
  const AuthH1Sub({super.key, required this.h1, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(h1,style: TextStyle(color: accentColor,fontSize: 36,fontWeight: FontWeight.w700),),
        Text(sub,style: TextStyle(color: subtitlesColor,fontSize: 16,fontWeight: FontWeight.w400),),
      ],
    );
  }
}
