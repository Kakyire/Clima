import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utils/constants.dart';
import 'package:clima/widgets/weather_info_text.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final weatherDetails;

  LocationScreen({@required this.weatherDetails});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String condition;
  String cityCountry;
  ImageProvider iconImage;

  NetworkHelper helper;

  @override
  void initState() {
    super.initState();
    _loadWeatherDetails(widget.weatherDetails);
  }

  void _loadWeatherDetails(dynamic weatherDetails) async {
    setState(() {
      String city = weatherDetails['name'];
      String country = weatherDetails['sys']['country'];
      var temp = weatherDetails['main']['temp'];
      temperature = temp.toInt();

      condition = weatherDetails['weather'][0]['main'];
      String icon = weatherDetails['weather'][0]['icon'];

      cityCountry = '$city - $country';

      // iconImage = await NetworkHelper.loadWeatherIcon(icon);
      iconImage = NetworkImage('http://openweathermap.org/img/wn/$icon@4x.png');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () async {
                      helper = NetworkHelper(await UserLocation.getLocation());
                      var weather = await helper.getData();
                      _loadWeatherDetails(weather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                      onPressed: () async {
                        var results = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));

                        if (results != null) {
                          String query = 'q=$results';
                          helper = NetworkHelper(query);
                          var data = await helper.getData();
                          _loadWeatherDetails(data);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ))
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  WeatherInfo(
                    text: '$temperature°',
                    textStyle: kTempTextStyle,
                  ),
                  Container(
                    child: Image(
                      image: iconImage,
                    ),
                  ),
                ],
              ),
              WeatherInfo(
                text: condition,
                textStyle: kConditionTextStyle,
              ),
              WeatherInfo(
                text: cityCountry,
                textStyle: kMessageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
