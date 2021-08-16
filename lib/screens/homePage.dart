import 'package:flutter/material.dart';
import 'package:flutter_weather/models/current_forecast.dart';
import 'package:flutter_weather/widgets/middle_widget.dart';
import 'package:flutter_weather/widgets/top_widget.dart';
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
  final String iconUrl = 'http://openweathermap.org/img/w/';

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    List<Color> _colors = [Color(0xFFED6161), Color(0xFF19557B)];
    final double smallContainerWidth = MediaQuery.of(context).size.width * 0.28;

    return Column(children: <Widget>[
      TopWidget(maxWidth: maxWidth, widget: widget),
      MiddleWidget(
          smallContainerWidth: smallContainerWidth,
          colors: _colors,
          widget: widget),
      Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
          )),
    ]);
  }
}
