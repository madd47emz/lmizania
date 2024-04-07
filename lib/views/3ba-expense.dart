import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/views/res/colors.dart';
import 'package:lmizania/views/util/category-badge.dart';

import '../repositories/transaction-repo.dart';
import '../view_models/2-expense-vm.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final CreateExpenseTransactionViewModel _viewModel =
      CreateExpenseTransactionViewModel(TransactionRepository());

  var itemName = '';
  var itemPrice = '';
  final TextEditingController dateInput = TextEditingController();

  List<CategoryBadge> chips = [
    CategoryBadge(
      category: 'Phone',
    ),
    CategoryBadge(
      category: 'Internet',
    ),
    CategoryBadge(
      category: 'Food',
    ),
    CategoryBadge(
      category: 'Bills',
    ),
    CategoryBadge(
      category: 'Car',
    ),
    CategoryBadge(
      category: 'Pet',
    ),
    CategoryBadge(
      category: 'Travel',
    ),
    CategoryBadge(
      category: 'Home',
    ),
    CategoryBadge(
      category: 'Charity',
    ),
    CategoryBadge(
      category: 'Sports',
    ),
    CategoryBadge(
      category: 'Health',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                    onChanged: (e) => {itemName = e},
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
                      fillColor: Colors.white,
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
                      hintText: "Item Name",
                      hintStyle: TextStyle(
                        color: mainColor.withOpacity(0.75),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
                  onChanged: (p) => {itemPrice = p},
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
                    fillColor: Colors.white,
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
                    hintText: "Item Price",
                    hintStyle: TextStyle(
                      color: mainColor.withOpacity(0.75),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  // validator:
                  cursorColor: mainColor),
            ), //price
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                    controller: dateInput,
                    readOnly: true,
                    style: const TextStyle(
                      color: mainColor,
                    ),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: accentColor,
                      ),
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios,
                        color: accentColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
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
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100));
      
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Must add Date!!!")));
                      }
                    },
                    cursorColor: mainColor)), //date
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Category", style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: chips,
                    ),
                  ],
                ),
              ),
            ), //categories wrap
            Container(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 46,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
