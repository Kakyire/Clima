import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final int temperature;
  final String condition;
  final String cityCountry;
  final ImageProvider icon;

  LocationScreen({
    @required this.temperature,
    @required this.condition,
    @required this.cityCountry,
    @required this.icon,
  });

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {},
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
                    text: '${widget.temperature}°',
                    textStyle: kTempTextStyle,
                  ),
                  Container(
                    child: Image(
                      image: widget.icon,
                    ),
                  ),
                ],
              ),
              WeatherInfo(
                text: widget.condition,
                textStyle: kConditionTextStyle,
              ),
              WeatherInfo(
                text: widget.cityCountry,
                textStyle: kMessageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    @required this.text,
    this.textStyle,
  });

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
          child: Text(
        text,
        style: textStyle,
      )),
    );
  }
}
/*
child: SafeArea(
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.stretch,
children: <Widget>[
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
FlatButton(
onPressed: () {},
child: Icon(
Icons.near_me,
size: 50.0,
),
),
FlatButton(
onPressed: () {},
child: Icon(
Icons.location_city,
size: 50.0,
),
),
],
),
Padding(
padding: EdgeInsets.only(left: 15.0),
child: Row(
children: <Widget>[
Text(
'32°',
style: kTempTextStyle,
),
Text(
'☀️',
style: kConditionTextStyle,
),
],
),
),
Padding(
padding: EdgeInsets.only(right: 15.0),
child: Text(
"It's 🍦 time in San Francisco!",
textAlign: TextAlign.right,
style: kMessageTextStyle,
),
),
],
),
)

 */
