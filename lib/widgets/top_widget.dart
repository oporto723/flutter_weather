import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/homePage.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
    required this.maxWidth,
    required this.widget,
  }) : super(key: key);

  final double maxWidth;

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          width: maxWidth,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Icon(
                  Icons.wb_cloudy,
                  color: Colors.blueAccent,
                  size: MediaQuery.of(context).size.aspectRatio * 300,
                ),
              ),
              TemperatureWidget(widget: widget),
              CityWidget(widget: widget),
            ],
          )),
    );
  }
}

// Widget to show city
class CityWidget extends StatelessWidget {
  const CityWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Container(
            child: Text(widget.currentForecast.name,
                style: TextStyle(fontSize: 20))),
      ),
    );
  }
}

// Widget to show tepmperature
class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            ' ' + widget.currentForecast.mainInfo.temp.round().toString() + '°',
          ),
        ),
      ),
    );
  }
}
