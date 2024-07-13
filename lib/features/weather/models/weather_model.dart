// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  final String currentSky;
  final num currentTemp;
  final num currentPressure;
  final num currentWindSpeed;
  final num currentHumidity;

  WeatherModel({
    required this.currentSky,
    required this.currentTemp,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentSky': currentSky,
      'currentTemp': currentTemp,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];
    return WeatherModel(
      currentSky: currentWeatherData['weather'][0]['main'],
      currentTemp: currentWeatherData['main']['temp'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
