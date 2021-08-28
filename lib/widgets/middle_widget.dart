import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/homePage.dart';

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    List<Color> _colors = [Color(0xFF0b65dd), Color(0xFF3f8a8f)];
    final double smallContainerWidth = MediaQuery.of(context).size.width * 0.28;

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
