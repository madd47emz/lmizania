import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';

import '3ba-expense.dart';
import '3ba-income.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  bool isTabbed = false;
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
          title: Text("New Transaction",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: mainColor,
          bottom: TabBar(

            indicatorColor: Colors.white  ,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.9),
            tabs: [
              Tab(icon: Icon(Icons.arrow_downward), text: 'Income'),
              Tab(icon: Icon(Icons.arrow_upward), text: 'Expense'),

            ],
          ),
        ),

        backgroundColor: backgroundShadeColor,
        body: TabBarView(
          children: [
            Income(),
            Expenses()
          ],
        ),
      ),
    ));
  }
}