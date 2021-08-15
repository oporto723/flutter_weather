import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.finalPosition}) : super(key: key);

  final Position finalPosition;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          color: Colors.red,
          child: Text(widget.finalPosition.altitude.toString()),
        ),
      ),
    );
  }
}
