import 'package:flutter/material.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';

class FoodHeader extends StatelessWidget {
  const FoodHeader({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            title.whiteText,
            const Spacer(),
            "View All >".whiteText,
          ],
        ));
  }
}
