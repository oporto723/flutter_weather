import 'package:flutter/material.dart';
import 'package:flutter_weather/models/current_forecast.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {Key? key, required this.finalPosition, required this.currentForecast})
      : super(key: key);

  final Position finalPosition;
  final CurrentForecast currentForecast;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          color: Colors.amber[100],
          child: Text(widget.currentForecast.name.toString()),
        ),
      ),
    );
  }
}
