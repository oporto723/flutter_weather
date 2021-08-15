import 'package:flutter/material.dart';
import 'package:flutter_weather/services/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'homePage.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final _geolocator = GeolocatorService();

  late Position _finalPosition;
  late Future<Position> _currentPosition;

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
      });
    });
    return location;
  }
}
