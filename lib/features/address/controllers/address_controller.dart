import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_deliver/services/location/location_services.dart';
import 'package:food_deliver/utils/extensions/util_extensions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class AddressController extends ChangeNotifier {
  final LocationRepository _locationRepository = LocationRepository(
    LocationPermissionServiceImpl(),
  );
  StreamSubscription<Position>? locationStream;

  //define TextEditingController for full name,  street, postal code, phoneNumber,
  TextEditingController fullNameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  //define a function to clear all the text fields
  void clearTextFields() {
    fullNameController.clear();
    streetController.clear();
    postalCodeController.clear();
    cityController.clear();
    phoneNumberController.clear();
  }

  void fillAddressControllers(String fullName, String street, String postalCode,
      String city, String phoneNumber) {
    fullNameController.text = fullName;
    streetController.text = street;
    postalCodeController.text = postalCode;
    cityController.text = city;
    phoneNumberController.text = phoneNumber;
  }

  //location scenario

  void checkAndHandlePermissions(BuildContext context) async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      // Handle the scenario where location service itself is disabled
      if (context.mounted) {
        context.showSnackBar('Please enable location services');
      }
    } else if (!await _locationRepository.isLocationPermissionGranted()) {
      if (await _locationRepository.requestLocationPermission()) {
        // Permission granted
        locationStream = _locationRepository.getCurrentLocation();
      } else {
        // Permission denied - check if it's denied forever and guide the user
        openAppSettings();
      }
    } else {
      // Location permission already granted
      locationStream = _locationRepository.getCurrentLocation();
    }
  }
}
