import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'package:food_deliver/features/dashboard/view/components/drawer/drawer_widget.dart';
import 'package:food_deliver/features/dashboard/view/components/food/food_header.dart';
import 'package:food_deliver/features/dashboard/view/components/food/food_list.dart';
import 'package:food_deliver/routes/route_names.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';

@RoutePage()
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: "Food Delivery".text,
        actions: [
          GestureDetector(
            onTap: () {
              context.router.pushNamed(RouteNames.cartScreen);
            },
            child: const Badge(
              isLabelVisible: true,
              label: Text("0"),
              child: Icon(Icons.shopping_cart),
            ),
          ),
          20.wBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            FoodHeader(
              color: Colors.green,
              title: "Veg",
            ),
            FoodListWidget(),
            20.hBox,
            FoodHeader(
              color: Colors.red,
              title: "Non-Veg",
            ),
            20.hBox,
          ],
        ),
      ),
    );
  }
}
