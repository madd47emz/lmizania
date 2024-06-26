import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back, color: Colors.white,),
        ),
        title: Text("Notifications",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: mainColor,
      ),
      backgroundColor: backgroundShadeColor,
    ));
}}
