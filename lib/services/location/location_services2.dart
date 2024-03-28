// Interfaces (ISP)

import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class LocationPermissionHandler {
  Future<PermissionStatus> requestPermission();
  Future<PermissionStatus> checkPermissionStatus();
  Future<void> openLocationSettings();
}

// Concrete Implementations (DIP)
class LocationPermissionHandlerImpl implements LocationPermissionHandler {
  @override
  Future<PermissionStatus> requestPermission() async {
    return await Permission.locationWhenInUse.request();
  }

  @override
  Future<PermissionStatus> checkPermissionStatus() async {
    return await Permission.locationWhenInUse.status;
  }

  @override
  Future<void> openLocationSettings() async {
    await openAppSettings();
  }
}

// Repository - For Handling Data and Interactions
class LocationRepository {
  final LocationPermissionHandler _permissionHandler;

  LocationRepository(
    LocationPermissionHandler permissionHandler,
  ) : _permissionHandler = permissionHandler;

  Future<bool> requestLocationPermission() async {
    final status = await _permissionHandler.requestPermission();
    return status.isGranted;
  }

  Future<bool> isLocationPermissionGranted() async {
    final status = await _permissionHandler.checkPermissionStatus();
    return status.isGranted;
  }

  Future<void> openLocationSettings() async {
    await _permissionHandler.openLocationSettings();
  }

  StreamSubscription<Position> getCurrentLocation() {
    // Get the current location stream
    return Geolocator.getPositionStream().listen((event) {});
  }
}
