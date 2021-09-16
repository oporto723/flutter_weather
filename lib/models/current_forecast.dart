// Current Forecast Model
class CurrentForecast {
  String name;
  Main mainInfo;
  Wind windInfo;
  WeatherInfo weatherInfo;
  Sys systemInfo;

  CurrentForecast(
      {required this.name,
      required this.mainInfo,
      required this.weatherInfo,
      required this.windInfo,
      required this.systemInfo});

  factory CurrentForecast.fromJson(Map<String, dynamic> json) {
    final name = json['name'];

    final mainInfoJson = json['main'];
    final mainInfo = Main.fromJson(mainInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = Wind.fromJson(windInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final systemInfoJson = json['sys'];
    final systemInfo = Sys.fromJson(systemInfoJson);

    return CurrentForecast(
        name: name,
        mainInfo: mainInfo,
        windInfo: windInfo,
        weatherInfo: weatherInfo,
        systemInfo: systemInfo);
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int humidity;

  Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final feelsLike = json['feels_like'];
    final tempMin = json['temp_min'];
    final tempMax = json['temp_max'];
    final humidity = json['humidity'];

    return Main(
        temp: temp,
        feelsLike: feelsLike,
        tempMin: tempMin,
        tempMax: tempMax,
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
  int id;
  String main;
  String description;
  String icon;

  WeatherInfo(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    final id = json['id'];
    final main = json['main'];

    return WeatherInfo(
        description: description, icon: icon, id: id, main: main);
  }
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    final country = json['country'];
    final sunrise = json['sunrise'];
    final sunset = json['sunset'];

    return Sys(country: country, sunrise: sunrise, sunset: sunset);
  }
}
