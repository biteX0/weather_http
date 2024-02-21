import 'dart:convert';

import 'package:flutter_application_2/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParametrs = {
      'q': city,
      'appid': '37279a3be9eb5678a378e453112f694d'
    };

    final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/weather', queryParametrs);
      final response = await http.get(uri);

      // ignore: avoid_print
      print(response.body);
      final json = jsonDecode(response.body);
      return WeatherResponse.fromJson(json);
  }

}