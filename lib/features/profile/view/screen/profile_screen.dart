import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/features/profile/controller/profile_controller.dart';
import 'package:food_deliver/features/profile/view/components/profile_options.dart';
import 'package:food_deliver/routes/app_router.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body:
          Consumer<ProfileController>(builder: (context, profileController, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                    20.wBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("John smith",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        10.hBox,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                  height: 60,
                                  width: context.width * 0.4,
                                  child: Text(
                                      "PS Qube, new town ,kolkata, 700156")),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _showPopUp();
                                },
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
                20.hBox,
                ProfileOptions(
                  text: "My Orders",
                  onTap: () {
                    context.router.push(const MyOrdersRoute());
                  },
                ),
                ProfileOptions(
                  text: "Address Book",
                  onTap: () {
                    context.router.push(const AddressBookRoute());
                  },
                ),
                20.hBox,
                ListTile(
                  title: const Text("Logout"),
                  onTap: () {},
                  leading: const Icon(Icons.logout),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  _showPopUp() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: const Text("Edit Profile"),
            content: SizedBox(
              height: 200,
              width: 200,
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Address"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Save")),
            ],
          );
        });
  }
}
