import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/address/controllers/address_controller.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({super.key});

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Book'),
        centerTitle: true,
      ),
      body: Consumer<AddressController>(
          builder: (context, addressController, child) {
        return Container();
      }),
    );
  }
}
