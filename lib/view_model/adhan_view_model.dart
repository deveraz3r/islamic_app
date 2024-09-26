import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as permissionHandler;
import 'package:shared_preferences/shared_preferences.dart'; // Make sure this is imported
import 'package:quran_filters/utils/app_urls.dart';

class AdhanViewModel extends GetxController {
  final Location location = Location();
  LocationData? _currentPosition;
  double? lat, long;

  RxString madhab = "hanafi".obs;
  PrayerTimes? prayerTimes;

  String timing = "today";

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    await _loadMadhab();
    print("Madhab loaded: ${madhab.value}");
    await getLoc(); // Ensure location is fetched before loading timing
    print("Location fetched ");
    await loadTiming();
    print("Prayer timings loaded");
  }

  Future<void> getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Enabling location service
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Getting location permission
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get current location and set lat/long
    _currentPosition = await location.getLocation();
    lat = _currentPosition?.latitude;
    long = _currentPosition?.longitude;

    if (kDebugMode) {
      print("Location loaded successfully c");
    }
  }

  // Future<void> getLoc() async {
  //   // Check if location service is enabled
  //   bool _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return; // Exit if the service cannot be enabled
  //     }
  //   }
  //
  //   // Check location permission status using permission_handler
  //   permissionHandler.PermissionStatus _permissionStatus = await permissionHandler.Permission.location.status;
  //   if (_permissionStatus.isDenied) {
  //     // Request permission if it's denied
  //     _permissionStatus = await permissionHandler.Permission.location.request();
  //     if (!_permissionStatus.isGranted) {
  //       return; // Exit if permission is not granted
  //     }
  //   }
  //
  //   // Get current location
  //   LocationData? _currentPosition = await location.getLocation();
  //   lat = _currentPosition?.latitude;
  //   long = _currentPosition?.longitude;
  //
  //   if (kDebugMode) {
  //     print("Location loaded successfully");
  //   }
  // }

  Future<void> setMadhab(String newMadhab) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString("madhab", newMadhab);
    madhab.value = newMadhab;
  }

  Future<void> _loadMadhab() async {
    final sp = await SharedPreferences.getInstance();
    String? savedMadhab = sp.getString("madhab");
    madhab.value = savedMadhab ?? 'hanafi';
  }

  Future<void> loadTiming() async {
    if (lat == null || long == null) {
      if (kDebugMode) {
        print("Location coordinates are not available.");
      }
      return; // Exit if coordinates are not available
    }

    final myCoordinates = Coordinates(lat!, long!);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = madhab.value == "hanafi" ? Madhab.hanafi : Madhab.shafi;
    prayerTimes = PrayerTimes.today(myCoordinates, params);

    if (kDebugMode) {
      print("Prayer timings loaded successfully");
    }
  }
}
