import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/views/res/colors.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  var itemName = '';

  var itemPrice = '';
  final TextEditingController dateInput = TextEditingController();
  DateTime _experation= DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    suffixIcon:  Icon(
                      Icons.arrow_forward_ios,
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
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      _experation = pickedDate;
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate);
                      setState(() {
                        dateInput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Must add Expiration Date!!!")));
                    }
                  },
                  cursorColor: mainColor)), //date
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
            ),
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
    );
  }
}
