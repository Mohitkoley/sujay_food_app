import 'package:flutter/material.dart';
import 'package:food_deliver/features/address/controllers/address_controller.dart';
import 'package:food_deliver/features/auth/controller/auth_controller.dart';
import 'package:food_deliver/features/cart/controller/cart_controller.dart';
import 'package:food_deliver/features/food/controller/food_controller.dart';
import 'package:food_deliver/features/orders/controller/order_controllers.dart';
import 'package:food_deliver/features/profile/controller/profile_controller.dart';
import 'package:food_deliver/routes/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthController()),
      ChangeNotifierProvider(create: (context) => FoodController()),
      ChangeNotifierProvider(create: (context) => CartController()),
      ChangeNotifierProvider(create: (context) => AddressController()),
      ChangeNotifierProvider(create: (context) => ProfileController()),
      ChangeNotifierProvider(create: (context) => OrderController()),
    ],
    builder: (context, _) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Food Deliver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(
        includePrefixMatches: true,
      ),
    );
  }
}
