import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/auth/controller/auth_controller.dart';
import 'package:food_deliver/shared/widgets/common_button.dart';
import 'package:food_deliver/shared/widgets/common_textfield.dart';
import 'package:food_deliver/utils/custom_shapes/uper_circle.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:food_deliver/utils/validators/common_validators.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin, CommonValidator {
  //controllers
  TabController? _tabController;
  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      20.hBox,
                      CommonTextField(
                        hintText: " Phone no",
                        controller: authController.phoneController,
                        prefix: const Text("+91 "),
                        keyboardType: TextInputType.number,
                        validator: phoneNumberValidator,
                        inputFormatters: phoneNumberFormatter,
                      ),
                      20.hBox,
                      CommonButton(
                        text: authController.isLoading
                            ? "Loading..."
                            : "Send otp",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authController.sendOtp(context);
                          } else {
                            context.showSnackBar("Please enter phone number");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
