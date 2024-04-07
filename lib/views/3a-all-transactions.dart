import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';
import 'package:lmizania/views/util/transaction-card.dart';

import '../models/transaction.dart';
import '../repositories/transaction-repo.dart';
import '../view_models/2-all-transactions-vm.dart';

class AllTransactions extends StatelessWidget {
  final List<TransactionCard> cards;
  
  const AllTransactions({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    final List<String> chipLabels = [
      'Today',
      'Yesterday',
      'Last Week',
      'Last Month',
    ];
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Transactions",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: mainColor,
      ),
      backgroundColor: backgroundShadeColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon: CircleAvatar(backgroundColor:mainColor,child: Icon(Icons.filter_alt_rounded,color: Colors.white,)),),
                SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 90,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: chipLabels.length,
                        itemBuilder: (context, index) {
                          final String label = chipLabels[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(
                              label: Text(
                                label,
                                style: TextStyle(color: mainColor),
                              ),
                            ),
                          );
                        })),


              ],
            ),
            SingleChildScrollView(
              child: Column(
                  children: cards
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class AllTransactionsLive extends StatefulWidget {
  const AllTransactionsLive({super.key});

  @override
  State<AllTransactionsLive> createState() => _AllTransactionsLiveState();
}

class _AllTransactionsLiveState extends State<AllTransactionsLive> {
  final _allTransactionsViewModel = AllTransactionsViewModel(TransactionRepository());

  @override
  void initState() {
    super.initState();
    _allTransactionsViewModel.loadAllTransactions();
  }
  @override
  Widget build(BuildContext context) {
    final List<String> chipLabels = [
      'Today',
      'Yesterday',
      'Last Week',
      'Last Month',
    ];
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Transactions",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: mainColor,
          ),
          backgroundColor: backgroundShadeColor,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: CircleAvatar(backgroundColor:mainColor,child: Icon(Icons.filter_alt_rounded,color: Colors.white,)),),
                    SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 90,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: chipLabels.length,
                            itemBuilder: (context, index) {
                              final String label = chipLabels[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Chip(
                                  label: Text(
                                    label,
                                    style: TextStyle(color: mainColor),
                                  ),
                                ),
                              );
                            })),


                  ],
                ), //filtering
                FutureBuilder<List<Transaction>>(
                  future: _allTransactionsViewModel.transactions,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if(snapshot.data!.isNotEmpty){
                        return ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => TransactionCard(transaction: snapshot.data![index],),
                        );}
                      else if (snapshot.data!.isEmpty){
                        return Center(child: Text("No Transactions"));
                      }
                    }
                    else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

