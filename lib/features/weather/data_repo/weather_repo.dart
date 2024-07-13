import 'package:bloc_learn/features/weather/data_scource/data_source.dart';
import 'package:bloc_learn/features/weather/models/weather_model.dart';

class WeatherRepo {
  final DataSource _dataSource;
  WeatherRepo(this._dataSource);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Akure';
      final res = await _dataSource.getCurrentWeather(cityName);

      return WeatherModel.fromJson(res);
    } catch (e) {
      throw e.toString();
    }
  }
}
