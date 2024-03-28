// Interfaces (Abstractions)
import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class LocationPermissionService {
  Future<PermissionStatus> requestPermission();
  Future<PermissionStatus> checkPermissionStatus();
}

// Concrete Implementation
class LocationPermissionServiceImpl implements LocationPermissionService {
  @override
  Future<PermissionStatus> requestPermission() async {
    return await Permission.locationWhenInUse.request();
  }

  @override
  Future<PermissionStatus> checkPermissionStatus() async {
    return await Permission.locationWhenInUse.status;
  }
}

// Repository - For Handling Data and Interactions
class LocationRepository {
  final LocationPermissionService _permissionService;

  LocationRepository(
    LocationPermissionService permissionService,
  ) : _permissionService = permissionService;

  Future<bool> requestLocationPermission() async {
    final status = await _permissionService.requestPermission();
    return status.isGranted;
  }

  Future<bool> isLocationPermissionGranted() async {
    final status = await _permissionService.checkPermissionStatus();
    return status.isGranted;
  }

  StreamSubscription<Position> getCurrentLocation() {
    // Get the current location stream
    return Geolocator.getPositionStream()
        .listen((event) {}, cancelOnError: false);
  }
}
