import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';

class UserLocation {
  ///Get current location and use it as a parameter for [NetworkHelper].
  static Future<String> getLocation() async {
    String query;
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      query = 'lat=${position.latitude}&lon=${position.longitude}';
    } catch (e) {
      print(e);
      print('Something went wrong');
    }
    return query;
  }
}
