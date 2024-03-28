import 'package:auto_route/auto_route.dart';
import 'package:food_deliver/features/address/view/address_book_screen.dart';
import 'package:food_deliver/features/address/view/address_screen.dart';
import 'package:food_deliver/features/auth/view/screens/auth_screen.dart';
import 'package:food_deliver/features/auth/view/screens/otp_screen.dart';
import 'package:food_deliver/features/cart/view/screen/cart_screen.dart';
import 'package:food_deliver/features/checkout/view/checkout_screen.dart';
import 'package:food_deliver/features/dashboard/view/screen/dashboard_screen.dart';
import 'package:food_deliver/features/orders/view/my_orders_screen.dart';
import 'package:food_deliver/features/profile/view/screen/profile_screen.dart';
import 'package:food_deliver/routes/route_names.dart';
import 'package:food_deliver/features/food/view/screens/food_detail_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: AuthRoute.page, path: RouteNames.authScreen, initial: true),
        AutoRoute(page: DashBoardRoute.page, path: RouteNames.dashBoardScreen),
        AutoRoute(page: OTPRoute.page, path: RouteNames.otpScreen),
        AutoRoute(page: CartRoute.page, path: RouteNames.cartScreen),
        AutoRoute(page: ProfileRoute.page, path: RouteNames.profileScreen),
        AutoRoute(
            page: FoodDetailRoute.page, path: RouteNames.foodDetailScreen),
        AutoRoute(page: CheckoutRoute.page, path: RouteNames.checkoutScreen),
        AutoRoute(
            page: AddAddressRoute.page, path: RouteNames.addAddressScreen),
        AutoRoute(
            page: AddressBookRoute.page, path: RouteNames.addressBookScreen),
        AutoRoute(page: MyOrdersRoute.page, path: RouteNames.myOrderScreen),
      ];
}
