import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/views/res/colors.dart';
import 'package:lmizania/views/util/category-badge.dart';

import '../repositories/transaction-repo.dart';
import '../view_models/2-income-vm.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final _formKey = GlobalKey<FormState>();

  final CreateIncomeTransactionViewModel _viewModel =
      CreateIncomeTransactionViewModel(TransactionRepository());

  var itemName = '';
  var itemPrice = '';
  final TextEditingController dateInput = TextEditingController();
  String selectedCategory = '';

  List<CategoryBadge> chips = [
    CategoryBadge(
      category: 'Salary',isTapped: false,
    ),
    CategoryBadge(
      category: 'College',isTapped: false,
    ),
    CategoryBadge(
      category: 'Loan',isTapped: false,
    )
  ];
  Widget _buildCategoryBadge(CategoryBadge badge) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = badge.category;
          chips = chips.map((element) => element.category == badge.category
              ? CategoryBadge(category: element.category, isTapped: !element.isTapped,)
              : CategoryBadge(category: element.category, isTapped: false,)).toList();
        });
        print(selectedCategory);
      },
      child: badge,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Must add Date!!!")));
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
                      Text(
                        "Category",
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: chips.map((badge) => _buildCategoryBadge(badge)).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () async{
                    // if (_formKey.currentState!.validate() ) {
                    //   if(selectedCategory != ''){
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) => const Center(
                    //       child:
                    //           CircularProgressIndicator(color: accentColor),
                    //     ),
                    //   );
                    //   Transaction message = await _viewModel.createTransaction(itemName, double.parse(itemPrice), today, selectedCategory)
                    //   Navigator.pop(context);
                    //   if (message == "success") {
                    //     Navigator.pop(
                    //         context)
                    //   } else
                    //     showDialog(
                    //         context: context,
                    //         builder: (context) => AlertDialog(
                    //               title: const Text(
                    //                 "Trouble",
                    //                 style: TextStyle(color: Colors.red),
                    //               ),
                    //               content: Text(message),
                    //               actions: [
                    //                 GestureDetector(
                    //                     onTap: () {
                    //                       Navigator.pop(context);
                    //                     },
                    //                     child: Padding(
                    //                       padding:
                    //                           const EdgeInsets.all(8.0),
                    //                       child: Text("return",
                    //                           style: TextStyle(
                    //                               fontWeight:
                    //                                   FontWeight.bold,
                    //                               fontSize: 15,
                    //                               color: mainColor)),
                    //                     ))
                    //               ],
                    //             ));
                    // }}
                  },
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
      ),
    );
  }
}
