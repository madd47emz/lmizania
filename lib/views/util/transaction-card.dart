import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';

import '../../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({Key? key, required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> categoryIcons = [Icons.home,Icons.car_crash,Icons.airplanemode_active,
      Icons.fastfood,Icons.book,Icons.phone,Icons.pets];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(//categoryIcons[transaction.categoryIdx],
            Icons.monetization_on, size: 36,color: mainColor,),
            title: Text("category",style: TextStyle(color: mainColor,fontSize: 16,fontWeight: FontWeight.bold),),
            subtitle: Text('object',style: TextStyle(color: mainColor.withOpacity(0.75),fontSize: 12),),
            trailing: Text("1000"+" DA",style: TextStyle(//color: transaction.type?Colors.green:Colors.red,
            color: Colors.red, fontSize: 16,fontWeight: FontWeight.bold),),
            onTap: ()async {},

          ),
        ),
      ),
    );
  }
}
