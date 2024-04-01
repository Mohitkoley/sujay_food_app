import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/auth/controller/auth_controller.dart';
import 'package:food_deliver/features/auth/view/components/login_tab.dart';
import 'package:food_deliver/features/auth/view/components/signup_tab.dart';
import 'package:food_deliver/utils/custom_shapes/uper_circle.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  //controllers
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthController>().clearfields;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthController>(builder: (context, authController, _) {
      return SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                clipper: UpperCircle(),
                child: Container(
                  height: context.height * 0.3,
                  width: context.width,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: context.height * 0.25,
              left: context.width * 0.08,
              right: context.width * 0.08,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  height: context.height * 0.6,
                  width: context.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        width: context.width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: Colors.black.withOpacity(0.3), width: 2),
                        ),
                        child: TabBar(
                          isScrollable: false,
                          dividerColor: Colors.transparent,
                          controller: _tabController,
                          indicator: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)),
                          unselectedLabelColor: Colors.red,
                          labelColor: Colors.white,
                          splashBorderRadius: BorderRadius.circular(30),
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          tabs: const [
                            Tab(
                              text: 'Login',
                            ),
                            Tab(
                              text: 'Sign Up',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            LoginTabWidget(
                                authController: authController,
                                phoneController:
                                    authController.phoneController),
                            SignupTabWidget(
                              phoneController: authController.phoneController,
                              nameController: authController.nameController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      );
    }));
  }
}
