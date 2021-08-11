import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  // Get the current location fo the device
  Future<Position> getCurentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position currentPosition;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, don't continue
      return Future.error('Location not enabled');
    }

    // Ask for permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permises are denied');
      }
    }
    // When permissions are grated, we get the actual position
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Return the current location
    return currentPosition;
  }
}
