import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/homePage.dart';

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({
    Key? key,
    required this.smallContainerWidth,
    required List<Color> colors,
    required this.widget,
  })  : _colors = colors,
        super(key: key);

  final double smallContainerWidth;
  final List<Color> _colors;
  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: smallContainerWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: _colors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Wind',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.speed,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    widget.currentForecast.windInfo.speed.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: smallContainerWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: _colors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Feels like',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.thermostat,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    widget.currentForecast.mainInfo.feelsLike.toString() + '°',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: smallContainerWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: _colors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Humidity',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.water,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    widget.currentForecast.mainInfo.humidity.toString() + '%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      flex: 1,
    );
  }
}
