import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/const/resource.dart';
import 'package:food_deliver/routes/app_router.dart';
import 'package:food_deliver/shared/widgets/common_text_style.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';

class FoodListWidget extends StatelessWidget {
  FoodListWidget({super.key});
  final CTS cts = CTS();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height * 0.2,
        child: ListView.separated(
            padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.router.push(FoodDetailRoute());
                },
                child: Container(
                    width: context.width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              offset: const Offset(0, 3))
                        ]),
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5),
                                        BlendMode.darken),
                                    fit: BoxFit.cover,
                                    image: const AssetImage(
                                      R.ASSETS_IMAGES_JPG_VEG_FOOD_JPG,
                                    )))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    cts.wb(
                                      "veg",
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    cts.wh1(
                                      '\u{20B9} 200',
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ],
                    )),
              );
            },
            itemCount: 3,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            }));
  }
}
