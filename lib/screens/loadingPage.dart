import 'package:flutter/material.dart';
import 'package:flutter_weather/models/current_forecast.dart';
import 'package:flutter_weather/services/geolocator.dart';
import 'package:flutter_weather/services/openweather.dart';
import 'package:flutter_weather/widgets/appBar.dart';
import 'package:geolocator/geolocator.dart';
import 'homePage.dart';
import 'package:intl/intl.dart';

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
  late String weatherIcon;

  @override
  void initState() {
    super.initState();
    _currentPosition = _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo: Create a new App bar
      // Todo: Create a new Drawer
      appBar: CustomAppBar(
        height: kToolbarHeight,
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
                currentForecast: _currentForecast,
                weatherIcon: weatherIcon,
              );
          }
        },
      ),
    );
  }

// Get the current Position
  Future<Position> _getLocation() async {
    var location = await _geolocator.getCurentLocation();
    {
      setState(() {
        _finalPosition = location;
        _getCurrentForecast();
      });
    }
    await Future.delayed(Duration(seconds: 2)).then((value) {});
    return location;
  }

// Get the forecast
  Future<void> _getCurrentForecast() async {
    var forecast = await _openWeather.getWeatherByCoordinates(
        _finalPosition.latitude.toString(),
        _finalPosition.longitude.toString());
    setState(() {
      _currentForecast = forecast;
      getWeatherIcon(forecast);
    });
  }

  void getWeatherIcon(CurrentForecast forecast) {
    switch (forecast.weatherInfo.main) {
      case 'Clouds':
        {
          weatherIcon = 'assets/images/scatered_clouds.png';
        }
        break;
      case 'Thunderstorm':
        {
          weatherIcon = 'assets/images/storm.png';
        }
        break;
      case 'Drizzle':
        {
          weatherIcon = 'assets/images/shower_rain.png';
        }
        break;
      case 'Rain':
        {
          weatherIcon = 'assets/images/rain.png';
        }
        break;
      case 'Snow':
        {
          weatherIcon = 'assets/images/snow.png';
        }
        break;
      case 'Clear':
        {
          weatherIcon = 'assets/images/sun.png';
        }
        break;
      default:
        {
          weatherIcon = 'assets/images/fog.png';
        }
        break;
    }
  }
}
