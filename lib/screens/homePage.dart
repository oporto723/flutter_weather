import 'package:flutter/material.dart';
import 'package:flutter_weather/models/current_forecast.dart';
import 'package:flutter_weather/widgets/middle_widget.dart';
import 'package:flutter_weather/widgets/top_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {Key? key,
      required this.finalPosition,
      required this.currentForecast,
      required this.weatherIcon})
      : super(key: key);

  final Position finalPosition;
  final CurrentForecast currentForecast;
  final String weatherIcon;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String iconUrl = 'http://openweathermap.org/img/w/';
  //final DateTime sunset = new DateTime.fromMicrosecondsSinceEpoch(widget.currentForecast.systemInfo.sunset.toInt());

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;

    //Format the Time for the sunrise
    final String sunrise = DateFormat('kk:mm:a').format(
        DateTime.fromMillisecondsSinceEpoch(
            widget.currentForecast.systemInfo.sunrise * 1000));

    //Format the Time for the sunset
    final String sunset = DateFormat('K:mm:a').format(
        DateTime.fromMillisecondsSinceEpoch(
            widget.currentForecast.systemInfo.sunset * 1000));

    return Column(children: <Widget>[
      TopWidget(
        maxWidth: maxWidth,
        widget: widget,
      ),
      MiddleWidget(widget: widget),
      Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    'Aditional information:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 2,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Temp min: ' +
                          widget.currentForecast.mainInfo.tempMin.toString() +
                          '°',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Temp max: ' +
                          widget.currentForecast.mainInfo.tempMax.toString() +
                          '°',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Sunrise: ' + sunrise,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sunset: ' + sunset,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    ]);
  }
}
