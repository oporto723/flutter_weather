import 'package:flutter/material.dart';
import 'package:flutter_weather/services/geolocator.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _geolocator = GeolocatorService();

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
              return new Center(
                child: Text('Result: ${snapshot.data!.latitude.toString()}'),
              );
          }
        },
      ),
    );
  }

  Future<Position> _getLocation() async {
    var location = await _geolocator.getCurentLocation();
    await Future.delayed(Duration(seconds: 2));
    return location;
  }
}
