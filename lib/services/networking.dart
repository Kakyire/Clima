import 'dart:convert';

import 'package:clima/utils/api.dart';
import 'package:clima/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String query;

  NetworkHelper(this.query);

  ///
  Future getData() async {
    http.Response response =
        await http.get('$url$query&appid=$API_KEY&units=metric');

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  ///Show icon for specific weather condition
  Future<ImageProvider> loadWeatherIcon(String icon) async {
    return NetworkImage('http://openweathermap.org/img/wn/$icon@4x.png');
  }
}
