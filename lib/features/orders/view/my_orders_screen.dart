import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/orders/controller/order_controllers.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        centerTitle: true,
      ),
      body: Consumer<OrderController>(
        builder: (context, orderController, _) {
          return Container();
        },
      ),
    );
  }
}
