// Current Forecast Model
class CurrentForecast {
  String name;
  Main mainInfo;
  Wind windInfo;
  WeatherInfo weatherInfo;

  CurrentForecast(
      {required this.name,
      required this.mainInfo,
      required this.weatherInfo,
      required this.windInfo});

  factory CurrentForecast.fromJson(Map<String, dynamic> json) {
    final name = json['name'];

    final mainInfoJson = json['main'];
    final mainInfo = Main.fromJson(mainInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = Wind.fromJson(windInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return CurrentForecast(
        name: name,
        mainInfo: mainInfo,
        windInfo: windInfo,
        weatherInfo: weatherInfo);
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  double presure;
  double humidity;

  Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.presure,
      required this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final feelsLike = json['feels_like'];
    final tempMin = json['temp_min'];
    final tempMax = json['temp_max'];
    final presure = json['presure'];
    final humidity = json['humidity'];

    return Main(
        temp: temp,
        feelsLike: feelsLike,
        tempMin: tempMin,
        tempMax: tempMax,
        presure: presure,
        humidity: humidity);
  }
}

class Wind {
  double speed;
  int deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    final deg = json['deg'];

    return Wind(speed: speed, deg: deg);
  }
}

class WeatherInfo {
  String description;
  String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}
