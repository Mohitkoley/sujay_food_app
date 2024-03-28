import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/cart/controller/cart_controller.dart';
import 'package:food_deliver/routes/app_router.dart';
import 'package:food_deliver/shared/widgets/common_button.dart';
import 'package:food_deliver/shared/widgets/common_text_style.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../const/resource.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CTS cts = CTS();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cart"),
        ),
        body: Consumer<CartController>(builder: (context, cartController, _) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.4,
                      child: ListView.separated(
                          itemCount: cartController.cartItems.length + 4,
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                                height: context.height * 0.13,
                                width: context.width,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 5,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      R.ASSETS_IMAGES_PNG_FISH_PNG,
                                      fit: BoxFit.fitHeight,
                                      alignment: Alignment.center,
                                    ),
                                    VerticalDivider(
                                      color: Colors.black,
                                      thickness: 0.4,
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  "fish",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.close))
                                            ],
                                          )),
                                          10.hBox,
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    border: Border.all(
                                                        color: Colors.black),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                          onTap: () {},
                                                          child: Icon(
                                                              Icons.remove)),
                                                      Text("1"),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Icon(Icons.add),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  '\u{20B9} 200',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          }),
                    ),
                    20.hBox,
                    SizedBox(
                        width: context.width,
                        child: const Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    10.hBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20)),
                          onPressed: () {
                            context.router.push(const AddAddressRoute());
                          },
                          child: Text("Add dddress")),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                    height: context.height * 0.1,
                    width: context.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              offset: const Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("Total \u{20B9} 200",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: context.width * 0.4,
                            height: context.height * 0.06,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              child: const Text("Pay",
                                  style: TextStyle(color: Colors.white)),
                            ))
                      ],
                    )),
              )
            ],
          );
        }));
  }
}
