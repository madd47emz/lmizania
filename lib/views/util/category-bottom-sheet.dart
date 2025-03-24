import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';
import '../../repositories/transaction-repo.dart';
import '../../view_models/2-actions-on-transaction-vm.dart';
import '../res/colors.dart';
import 'category-badge.dart';

class CategoryBottomSheet extends StatefulWidget {
  final bool type; //income or expense
  const CategoryBottomSheet({super.key, required this.type,});

  @override
  State<CategoryBottomSheet> createState() =>
      _CategoryBottomSheetState();
}

class _CategoryBottomSheetState
    extends State<CategoryBottomSheet> {



  List<String> selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    List<CategoryBadge> chips = widget.type?[
      CategoryBadge(
        category: 'Salary',isTapped: false,
      ),
      CategoryBadge(
        category: 'College',isTapped: false,
      ),
      CategoryBadge(
        category: 'Loan',isTapped: false,
      )
    ]: [
      CategoryBadge(
        category: 'Phone',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Internet',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Food',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Bills',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Car',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Pet',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Travel',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Home',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Charity',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Sports',
        isTapped: false,
      ),
      CategoryBadge(
        category: 'Health',
        isTapped: false,
      ),
    ];
    Widget _buildCategoryBadge(CategoryBadge badge) {
      return GestureDetector(
        onTap: () {
          // Create a new CategoryBadge with isSelected set to true for the tapped badge
          setState(() {
            selectedCategory.add(badge.category);
            chips = chips
                .map((element) => element.category == badge.category
                ? CategoryBadge(
              category: element.category,
              isTapped: !element.isTapped,
            )
                : element)
                .toList();
          });
          print(selectedCategory);
        },
        child: badge,
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
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
                    children: chips
                        .map((badge) => _buildCategoryBadge(badge))
                        .toList(),
                  ),
                ],
              ),
            ),
          ), //categories wrap
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () async {
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
                    'Apply',
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
