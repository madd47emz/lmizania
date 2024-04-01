import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242424),
      appBar: AppBar(
        backgroundColor: Color(0xFF242424),
        title: Center(
          child: Text(
            "إشعارات",
            style: TextStyle(fontFamily: 'Riwaya', fontSize: 40),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            trailing: Icon(Icons.book,color: Colors.white,size: 30,),
            title: Center(
              child: Text(
                "كاتبك المفضل قام باضافة كتاب",
                style: TextStyle(fontFamily: 'Riwaya', fontSize: 20,color: Colors.white),
              ),
            ),
            leading: Text("1h",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 8),
            child: Container(
              height: 1,
              width: 20,
              color: Colors.white,
            ),
          ),


        ],
      ),
    );
  }
}
