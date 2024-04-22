import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/const/resource.dart';
import 'package:food_deliver/routes/app_router.dart';
import 'package:food_deliver/shared/widgets/common_text_style.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({
    super.key,
    required this.cts,
  });

  final CTS cts;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.router.push(const FoodDetailRoute());
        },
        child: Container(
          width: context.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  R.ASSETS_IMAGES_JPG_VEG_FOOD_JPG,
                  height: context.height * 0.12,
                  width: context.width * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              10.hBox,
              const Text(
                "Veg thali",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              const Text(
                "\u{20B9} 150",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ));
  }
}
