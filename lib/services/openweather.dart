import 'dart:convert';
import 'package:flutter_weather/models/current_forecast.dart';
import 'package:http/http.dart' as http;

class OpenweatherService {
  final String appid = '1255f69081bf4430032a8042eb7b96b7';
  final String units = 'metric';

  // Get the Forecast introducing the city
  Future<CurrentForecast> getWeatherByCity(String city) async {
    final queryParameters = {
      'q': city,
      'appid': appid,
      'units': units,
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final res = await http.get(uri);

    final json = jsonDecode(res.body);
    return CurrentForecast.fromJson(json);
  }

  // Get the Forecast passing the coordinates
  Future<CurrentForecast> getWeatherByCoordinates(
      String latitude, String longitude) async {
    final queryParameters = {
      'lat': latitude,
      'lon': longitude,
      'appid': appid,
      'units': units,
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final res = await http.get(uri);

    final json = jsonDecode(res.body);
    return CurrentForecast.fromJson(json);
  }
}
