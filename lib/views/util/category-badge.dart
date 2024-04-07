import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/category-iconData.dart';
import '../res/colors.dart';



class CategoryBadge extends StatefulWidget {
  final String category;

  const CategoryBadge({super.key, required this.category});

  @override
  State<CategoryBadge> createState() => _CategoryBadgeState();
}

class _CategoryBadgeState extends State<CategoryBadge> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: isTapped?mainColor:mainColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: (){
          isTapped != isTapped;
          setState(() {

          });
          },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(categories[widget.category],color: isTapped?Colors.white:mainColor, size: 30,),
            Text(widget.category, style: TextStyle(color: isTapped?Colors.white:mainColor, fontSize: 14,fontWeight: FontWeight.w400),),

          ],
        ),
      ),
    );
  }
}
