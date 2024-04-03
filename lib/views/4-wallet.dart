import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          title: Text("Wallet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: mainColor,
          bottom: TabBar(
            indicatorColor: Colors.white  ,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.9),
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'Personal'),
              Tab(icon: Icon(Icons.group), text: 'Group'),

            ],
          ),
        ),

        backgroundColor: backgroundShadeColor,
        body: TabBarView(
          children: [
            //Personal(),
            //Group()
          ],
        ),
      ),
    ));
  }
}
