import 'package:flutter/material.dart';
import 'package:lmizania/views/res/colors.dart';

import '../../models/transaction.dart';
import '../../repositories/transaction-repo.dart';
import '../../view_models/2-actions-on-transaction-vm.dart';
import '../res/category-iconData.dart';
import 'actions-on-transaction-bottom-sheet.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({Key? key, required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            leading: Icon(//categories[transaction.category]
            Icons.monetization_on, size: 36,color: mainColor,),
            title: Text("category",style: TextStyle(color: mainColor,fontSize: 16,fontWeight: FontWeight.bold),),
            subtitle: Text('object',style: TextStyle(color: mainColor.withOpacity(0.75),fontSize: 12),),
            trailing: Text("1000"+" DA",style: TextStyle(//color: transaction.type?Colors.green:Colors.red,
            color: Colors.red, fontSize: 16,fontWeight: FontWeight.bold),),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => actionsOnTransactionBottomSheet(context,transaction),
              );

            },

          ),
        ),
      ),
    );
  }
}
