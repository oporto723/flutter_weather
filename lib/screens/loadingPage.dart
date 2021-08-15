import 'package:flutter/material.dart';
import 'package:flutter_weather/models/current_forecast.dart';
import 'package:flutter_weather/services/geolocator.dart';
import 'package:flutter_weather/services/openweather.dart';
import 'package:geolocator/geolocator.dart';
import 'homePage.dart';

// Class where load all the Future Services
class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final _geolocator = GeolocatorService();
  final _openWeather = OpenweatherService();

  late Position _finalPosition;
  late Future<Position> _currentPosition;
  late CurrentForecast _currentForecast;

  @override
  void initState() {
    super.initState();
    _currentPosition = _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: FutureBuilder<Position>(
        future: _currentPosition,
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                  // Todo: Create a Pop up window
                  );
            case ConnectionState.active:
              return Center(
                  // Todo: Create a Pop up window
                  );
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return HomePage(
                finalPosition: _finalPosition,
              );
          }
        },
      ),
    );
  }

// Get the current Position
  Future<Position> _getLocation() async {
    var location = await _geolocator.getCurentLocation();
    await Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _finalPosition = location;
        _getCurrentForecast();
      });
    });
    return location;
  }

// Get the forecast
  Future<void> _getCurrentForecast() async {
    var forecast = await _openWeather.getWeatherByCoordinates(
        _finalPosition.latitude.toString(),
        _finalPosition.longitude.toString());
    print(forecast.name.toString());
    setState(() {
      _currentForecast = forecast;
      print(_currentForecast.mainInfo.tempMax.toString());
    });
  }
}
