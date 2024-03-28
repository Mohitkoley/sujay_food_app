import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/const/resource.dart';
import 'package:food_deliver/features/food/controller/food_controller.dart';
import 'package:food_deliver/shared/widgets/common_button.dart';
import 'package:food_deliver/shared/widgets/common_text_style.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  CTS cts = CTS();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FoodController>(builder: (context, foodController, _) {
        return SafeArea(
            child: Column(
          children: [
            SizedBox(
              width: context.width,
              height: context.height * 0.4,
              child: Image.asset(
                R.ASSETS_IMAGES_PNG_FISH_PNG,
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
            ),
            20.hBox,
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: context.width * 0.4,
                              height: context.height * 0.15,
                              child: CTS().bh1("Fishsdfasdfasdfasdfasdfasdfsa"),
                            ),
                            10.wBox,
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                height: context.height * 0.06,
                                width: context.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        foodController.decrement();
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        size: 20,
                                      ),
                                    ),
                                    cts.bh1("${foodController.counter}"),
                                    GestureDetector(
                                      onTap: () {
                                        foodController.increment();
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        10.hBox,
                        const Spacer(),
                        CommonButton(text: "Add to cart", onPressed: () {}),
                      ],
                    )))
          ],
        ));
      }),
    );
  }
}
