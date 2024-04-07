import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';
import '../../repositories/transaction-repo.dart';
import '../../view_models/2-actions-on-transaction-vm.dart';
import '../res/colors.dart';
import 'category-badge.dart';

Widget actionsOnTransactionBottomSheet(BuildContext context,Transaction transaction) {

  bool _readOnly = true;
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  TextEditingController _dateInput = TextEditingController(text: formattedDate);
  TextEditingController _nameInput = TextEditingController(text: "table");
  TextEditingController _priceInput = TextEditingController(text: "25 000"+" DA");

  final ActionTransactionViewModel viewModel= ActionTransactionViewModel(TransactionRepository());
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 10.0,
          spreadRadius: 5.0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 36,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ), //bottomsheet top handle
          const SizedBox(height: 8),
          const Text(
            'Transaction',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Open Sans',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          CategoryBadge(category: 'Home'),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                readOnly: _readOnly,
                controller: _nameInput,
                  onChanged: (e) => {_nameInput.text = e},
                  style: const TextStyle(
                    color: mainColor,
                  ),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.label,
                      color: accentColor,
                    ),
                    filled: true,
                    fillColor: mainColor.withOpacity(0.15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: accentColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: accentColor,
                        width: 1,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Name";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: mainColor)), //name
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              controller: _priceInput,
                readOnly: _readOnly,
                onChanged: (p) => {_priceInput.text = p},
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter price";
                  } else {
                    return null;
                  }
                },
                style: const TextStyle(color: mainColor),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: accentColor,
                  ),
                  filled: true,
                  fillColor: mainColor.withOpacity(0.15),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: accentColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: accentColor,
                      width: 1,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                cursorColor: mainColor),
          ), //price
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                  controller: _dateInput,
                  readOnly: _readOnly,
                  style: const TextStyle(
                    color: mainColor,
                  ),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: accentColor,
                    ),
                    filled: true,
                    fillColor: mainColor.withOpacity(0.15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: accentColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: accentColor,
                        width: 1,
                      ),
                    ),
                    hintText: "Today",
                    hintStyle: TextStyle(
                      color: mainColor.withOpacity(0.75),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () async {
                    if(!_readOnly){
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate);

                        _dateInput.text =
                            formattedDate; //set output date to TextField value.

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Must add Date!!!")));
                    }
                  }},
                  cursorColor: mainColor)), //date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                  ),
                  onLongPress: (){

                    //TODO: viewModel.updateTransaction(transaction);
                    _readOnly = true;
                  },
                  onPressed: (){
                    _readOnly = false;

                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit,color: Colors.white,size: 22,),
                      Text('Edit', style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: (){

                    //TODO: viewModel.deleteTransaction(transaction.id);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete,color: Colors.red,size: 22,),
                        Text('Delete', style: TextStyle(color: Colors.red, fontSize: 18,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
              ),

                      ],
                    ), //action
    ],
  )));
}

