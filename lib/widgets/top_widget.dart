import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/homePage.dart';
import 'package:google_fonts/google_fonts.dart';

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
          color: Colors.white,
          width: maxWidth,
          child: Column(
            children: [
              IconWidget(),
              TemperatureWidget(widget: widget),
              CityWidget(widget: widget),
            ],
          )),
    );
  }
}

// Widget to show the top weather Icon
class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Icon(
          Icons.wb_sunny,
          color: Colors.orangeAccent,
          //size: MediaQuery.of(context).size.height,
        ),
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
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          ' ' + widget.currentForecast.mainInfo.temp.round().toString() + '°',
        ),
      ),
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
          alignment: Alignment.topCenter,
          child: Text(widget.currentForecast.name,
              style: GoogleFonts.balooPaaji(fontSize: 25)),
        ),
      ),
    );
  }
}
