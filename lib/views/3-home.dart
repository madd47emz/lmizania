import 'package:flutter/material.dart';
import 'package:lmizania/models/transaction.dart';
import 'package:lmizania/views/3a-all-transactions.dart';
import 'package:lmizania/views/3b-new-transaction.dart';
import 'package:lmizania/views/res/colors.dart';
import 'package:lmizania/views/util/transaction-card.dart';

import '../repositories/transaction-repo.dart';
import '../view_models/home-vm.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _homeViewModel = HomeViewModel(TransactionRepository());
  var _goToAllTransactions = true;

  List<Widget> chips = [const Chip(label: Text("Recent transactions",style: TextStyle(color: mainColor,fontSize: 16,fontWeight: FontWeight.w600),),backgroundColor: Colors.white,)];

  List<TransactionCard> cards =[TransactionCard(transaction: Transaction(id: 1, title: '', amount: 0.0, date: DateTime.now(), type: true, category: '')),
    TransactionCard(transaction: Transaction(id: 1, title: '', amount: 0.0, date: DateTime.now(), type: true, category: '')),
    TransactionCard(transaction: Transaction(id: 1, title: '', amount: 0.0, date: DateTime.now(), type: true, category: '')),
    TransactionCard(transaction: Transaction(id: 1, title: '', amount: 0.0, date: DateTime.now(), type: true, category: '')),
    TransactionCard(transaction: Transaction(id: 1, title: '', amount: 0.0, date: DateTime.now(), type: true, category: ''))];

  // @override
  // void initState() {
  //   super.initState();
  //   _homeViewModel.loadRecentTransactions();
  // }

  @override
  Widget build(BuildContext context) {
    var totalBalance = 52000000;
    return SafeArea(child: Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.person, color: Colors.white,),
        ),
        title: Text("Hi Mohamed!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.notifications, color: Colors.white,),
          ),
        ],
        backgroundColor: mainColor,
      ),
      backgroundColor: backgroundShadeColor,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewTransaction()));
      },backgroundColor: mainColor,child: Icon(Icons.add,color: Colors.white,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Balance",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white,fontFamily: "Open Sans"),)
                              ,Text(totalBalance.toString()+"DA",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: Colors.white,fontFamily: "Open Sans"),)
                            ],
                          ),
                          Icon(Icons.wallet,color: Colors.white,size: 64,)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Container(

                            child: ListTile(

                              leading: Icon(Icons.upload_rounded,color: Colors.red,),
                              title: Text("1000 DA",style: TextStyle(color: mainColor),),
                            ),
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white
                            ),
                            child: ListTile(
                              leading: Icon(Icons.download_rounded,color: Colors.green,),
                              title: Text("1000 DA",style: TextStyle(color: mainColor),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                height: 138,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      // First gradient
                      Color.fromRGBO(0, 73, 76, 0.8), // Adjust transparency (alpha) as needed
                      Color.fromRGBO(0, 104, 108, 0.7),
                      Color.fromRGBO(0, 120, 124, 1.0), // #00787D converted to RGBO
                      Color.fromRGBO(0, 140, 146, 0.7),
                      Color.fromRGBO(0, 73, 76, 0.8),
                    ],
                    stops: [0.1315, 0.3132, 0.4776, 0.686, 0.9489], // Positions of the colors
                  ),
                ),
              ),//wallet
              SizedBox(height: 24,),
              Wrap(
                  spacing: 0,
                  children: chips
              ), //recent transaction
              Column(
                children: cards,
              ),
              // FutureBuilder<List<Transaction>>(
              //   future: _homeViewModel.recentTransactions,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       if(snapshot.data!.isNotEmpty){
              //         _goToAllTransactions = true;
              //       return ListView.builder(
              //         itemBuilder: (context, index) => TransactionCard(transaction: snapshot.data![index],),
              //       );}
              //       else if (snapshot.data!.isEmpty){
              //         return Center(child: Text("No Transactions"));
              //       }
              //     }
              //     else if (snapshot.hasError) {
              //       return Center(child: Text('Error: ${snapshot.error}'));
              //     }
              //     return Center(child: CircularProgressIndicator());
              //   },
              // ),
              _goToAllTransactions?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 19,horizontal: 16 ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllTransactions(cards: cards,)));
                  },
                  child: Container(
                    height: 46,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: mainColor,width: 2
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'All Transactions',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: mainColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Icon(Icons.expand,color: mainColor,),

                        ],
                      ),
                    ),
                  ),
                ),
              ):SizedBox(height: 1,width: 1,), //all transactions

            ],
          ),
        ),
      ),
    ));
  }
}
