import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/address/controllers/address_controller.dart';
import 'package:food_deliver/shared/widgets/common_button.dart';
import 'package:food_deliver/shared/widgets/common_textfield.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddressController>(
        builder: (context, addressController, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Your Address'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CommonTextField(
                      controller: addressController.fullNameController,
                      hintText: 'Full Name',
                      prefix: const Icon(Icons.person)),
                  30.hBox,
                  CommonTextField(
                    controller: addressController.streetController,
                    hintText: 'Street or Building Name',
                    prefix: const Icon(Icons.location_on),
                  ),
                  30.hBox,
                  CommonTextField(
                      controller: addressController.postalCodeController,
                      hintText: 'Postal Code',
                      prefix: const Icon(Icons.local_post_office)),
                  30.hBox,
                  CommonTextField(
                      controller: addressController.cityController,
                      hintText: 'City',
                      prefix: const Icon(Icons.location_city)),
                  30.hBox,
                  CommonTextField(
                      controller: addressController.phoneNumberController,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      prefix: Text(" +91 ")),
                  30.hBox,
                  CommonButton(text: "Submit", onPressed: () {})
                ],
              ),
            ),
          ));
    });
  }
}
