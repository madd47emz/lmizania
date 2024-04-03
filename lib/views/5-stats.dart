import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back, color: Colors.white,),
        ),
        title: Text("Statistics",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: mainColor,
      ),
      backgroundColor: backgroundShadeColor,
    ));
  }
}
