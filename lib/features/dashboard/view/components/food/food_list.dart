import 'package:flutter/material.dart';
import 'package:food_deliver/features/dashboard/view/components/food/food_list_item.dart';
import 'package:food_deliver/shared/widgets/common_text_style.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';

class FoodListWidget extends StatelessWidget {
  FoodListWidget({super.key});
  final CTS cts = CTS();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height * 0.24,
        child: ListView.separated(
            padding:
                const EdgeInsets.only(right: 10, top: 10, bottom: 10, left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FoodItemWidget(cts: cts);
            },
            itemCount: 3,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            }));
  }
}
