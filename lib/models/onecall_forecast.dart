// Model Forecast just for one call api
class OnecallForecast {
  String timeZone;
  List<DailyForecast> dailyForecast;

  OnecallForecast({required this.dailyForecast, required this.timeZone});

  factory OnecallForecast.fromJson(Map<String, dynamic> json) {
    if (json['daily'] != null) {
      var dailyForecastObjsJson = json['daily'];
      List<DailyForecast> _dailyForecasts = dailyForecastObjsJson
          .map((dailyForecastJson) => DailyForecast.fromJson(dailyForecastJson))
          .toList();
      final timeZone = json['timezone'];
      return OnecallForecast(
          dailyForecast: _dailyForecasts, timeZone: timeZone);
    } else {
      final timeZone = json['timezone'];
      return OnecallForecast(timeZone: timeZone, dailyForecast: []);
    }
  }
}

class DailyForecast {
  int dayTime;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  double windDeg;
  int clouds;
  double pop;
  double rain;
  double uvi;
  DailyTemp dailyTemp;
  DailyWeatherInfo dailyWeatherInfo;

  DailyForecast(
      {required this.dayTime,
      required this.sunrise,
      required this.sunset,
      required this.moonrise,
      required this.moonset,
      required this.moonPhase,
      required this.pressure,
      required this.humidity,
      required this.dewPoint,
      required this.windSpeed,
      required this.windDeg,
      required this.clouds,
      required this.pop,
      required this.rain,
      required this.uvi,
      required this.dailyTemp,
      required this.dailyWeatherInfo});

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    final daytime = json['dt'];
    final sunrise = json['sunrise'];
    final sunset = json['sunset'];
    final moonrise = json['moonrise'];
    final moonset = json['moonset'];
    final moonPhase = json['moon_phase'];
    final dewPoint = json['dew_point'];
    final humidity = json['humidity'];
    final pressure = json['pressure'];
    final windDeg = json['wind_deg'];
    final windSpeed = json['wind_speed'];
    final clouds = json['clouds'];
    final pop = json['pop'];
    final rain = json['rain'];
    final uvi = json['uvi'];

    final dailyTempJson = json['temp'];
    final dailyTemp = DailyTemp.fromJson(dailyTempJson);

    final dailyWeatherInfoJson = json['weather'];
    final dailyWeatherinfo = DailyWeatherInfo.fromJson(dailyWeatherInfoJson);

    return DailyForecast(
        dayTime: daytime,
        sunrise: sunrise,
        sunset: sunset,
        moonrise: moonrise,
        moonset: moonset,
        moonPhase: moonPhase,
        dewPoint: dewPoint,
        humidity: humidity,
        pressure: pressure,
        windDeg: windDeg,
        windSpeed: windSpeed,
        clouds: clouds,
        pop: pop,
        rain: rain,
        uvi: uvi,
        dailyTemp: dailyTemp,
        dailyWeatherInfo: dailyWeatherinfo);
  }
}

class DailyTemp {
  double morningTemp;
  double eveningTemp;
  double nightTemp;
  double dailyTemp;
  double dayMinTemp;
  double dayMaxTemp;

  DailyTemp(
      {required this.morningTemp,
      required this.eveningTemp,
      required this.dailyTemp,
      required this.dayMaxTemp,
      required this.dayMinTemp,
      required this.nightTemp});

  factory DailyTemp.fromJson(Map<String, dynamic> json) {
    final morningTemp = json['morn'];
    final nightTemp = json['night'];
    final eveningTemp = json['eve'];
    final dailyTemp = json['day'];
    final dayMaxTemp = json['max'];
    final dayMinTemp = json['min'];

    return DailyTemp(
        morningTemp: morningTemp,
        eveningTemp: eveningTemp,
        dailyTemp: dailyTemp,
        dayMaxTemp: dayMaxTemp,
        dayMinTemp: dayMinTemp,
        nightTemp: nightTemp);
  }
}

class DailyWeatherInfo {
  int id;
  String main;
  String description;
  String icon;

  DailyWeatherInfo(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory DailyWeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    final id = json['id'];
    final main = json['main'];

    return DailyWeatherInfo(
        description: description, icon: icon, id: id, main: main);
  }
}


// {
//   "lat": 33.44,
//   "lon": -94.04,
//   "timezone": "America/Chicago",
//   "timezone_offset": -21600,
//   "current": {
//     "dt": 1618317040,
//     "sunrise": 1618282134,
//     "sunset": 1618333901,
//     "temp": 284.07,
//     "feels_like": 282.84,
//     "pressure": 1019,
//     "humidity": 62,
//     "dew_point": 277.08,
//     "uvi": 0.89,
//     "clouds": 0,
//     "visibility": 10000,
//     "wind_speed": 6,
//     "wind_deg": 300,
//     "weather": [
//       {
//         "id": 500,
//         "main": "Rain",
//         "description": "light rain",
//         "icon": "10d"
//       }
//     ],
//     "rain": {
//       "1h": 0.21
//     }
//   },
//     "minutely": [
//     {
//       "dt": 1618317060,
//       "precipitation": 0.205
//     },
//     ...
//   },
//     "hourly": [
//     {
//       "dt": 1618315200,
//       "temp": 282.58,
//       "feels_like": 280.4,
//       "pressure": 1019,
//       "humidity": 68,
//       "dew_point": 276.98,
//       "uvi": 1.4,
//       "clouds": 19,
//       "visibility": 306,
//       "wind_speed": 4.12,
//       "wind_deg": 296,
//       "wind_gust": 7.33,
//       "weather": [
//         {
//           "id": 801,
//           "main": "Clouds",
//           "description": "few clouds",
//           "icon": "02d"
//         }
//       ],
//       "pop": 0
//     },
//     ...
//   }
//     "daily": [
//     {
//       "dt": 1618308000,
//       "sunrise": 1618282134,
//       "sunset": 1618333901,
//       "moonrise": 1618284960,
//       "moonset": 1618339740,
//       "moon_phase": 0.04,
//       "temp": {
//         "day": 279.79,
//         "min": 275.09,
//         "max": 284.07,
//         "night": 275.09,
//         "eve": 279.21,
//         "morn": 278.49
//       },
//       "feels_like": {
//         "day": 277.59,
//         "night": 276.27,
//         "eve": 276.49,
//         "morn": 276.27
//       },
//       "pressure": 1020,
//       "humidity": 81,
//       "dew_point": 276.77,
//       "wind_speed": 3.06,
//       "wind_deg": 294,
//       "weather": [
//         {
//           "id": 500,
//           "main": "Rain",
//           "description": "light rain",
//           "icon": "10d"
//         }
//       ],
//       "clouds": 56,
//       "pop": 0.2,
//       "rain": 0.62,
//       "uvi": 1.93
//     },
//     ...
//     },
//     "alerts": [
//     {
//       "sender_name": "NWS Tulsa",
//       "event": "Heat Advisory",
//       "start": 1597341600,
//       "end": 1597366800,
//       "description": "...HEAT ADVISORY REMAINS IN EFFECT FROM 1 PM THIS AFTERNOON TO\n8 PM CDT THIS EVENING...\n* WHAT...Heat index values of 105 to 109 degrees expected.\n* WHERE...Creek, Okfuskee, Okmulgee, McIntosh, Pittsburg,\nLatimer, Pushmataha, and Choctaw Counties.\n* WHEN...From 1 PM to 8 PM CDT Thursday.\n* IMPACTS...The combination of hot temperatures and high\nhumidity will combine to create a dangerous situation in which\nheat illnesses are possible.",
//       "tags": [
//         "Extreme temperature value"
//         ]
//     },
//     ...
