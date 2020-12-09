import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _getLocationData() async {
    Location location = Location();
    await location.getLocation();
    String query = 'lat=${location.latitude}&lon=${location.longitude}';
    NetworkHelper helper = NetworkHelper(query);
    var decode = await helper.getData();

    String city = decode['name'];
    String country = decode['sys']['country'];
    var temperature = decode['main']['temp'];
    String condition = decode['weather'][0]['main'];
    String icon = decode['weather'][0]['icon'];

    String cityCountry = '$city - $country';

    ImageProvider iconImage = await helper.loadWeatherIcon(icon);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            temperature: temperature.toInt(),
            condition: condition,
            cityCountry: cityCountry,
            icon: iconImage,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
