import 'package:geolocator/geolocator.dart';

class Location {

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      // Handle location service errors
      print('Error getting location: $e');
    }
  }
}