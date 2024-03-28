import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/dashboard/view/components/drawer/drawer_child_widget.dart';
import 'package:food_deliver/routes/route_names.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: context.width * 0.6,
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.07,
            ),
            DrawerChild(
              title: "Home",
              icon: Icons.home,
              onTap: () {},
            ),
            DrawerChild(
              title: "Profile",
              icon: Icons.person,
              onTap: () {
                context.nav.pop();
                context.router.pushNamed(RouteNames.profileScreen);
              },
            ),
          ],
        ));
  }
}
