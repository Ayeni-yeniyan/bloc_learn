import 'package:http/http.dart' as http;

class DataSource {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=330bc5e7cae22a46e684ae9b2ee5185e',
        ),
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
