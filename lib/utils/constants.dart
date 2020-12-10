import 'package:flutter/material.dart';

const String url = 'https://api.openweathermap.org/data/2.5/weather?';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  icon: Icon(
    Icons.location_city,
  ),
  hintText: 'Enter city name',
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      ),
      borderSide: BorderSide.none),
  hintStyle: TextStyle(
    color: Colors.blueGrey,
  ),
);
