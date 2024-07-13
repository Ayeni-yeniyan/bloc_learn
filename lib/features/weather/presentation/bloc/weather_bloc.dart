import 'package:bloc_learn/features/weather/data_repo/weather_repo.dart';
import 'package:bloc_learn/features/weather/models/weather_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo _weatherRepo;
  WeatherBloc(this._weatherRepo) : super(WeatherInitial()) {
    on<WeatherFetched>(_weatherFetched);
  }
  Future<void> _weatherFetched(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherStateLoading());
      final weather = await _weatherRepo.getCurrentWeather();
      emit(WeatherStateSuccess(weather));
    } catch (e) {
      emit(WeatherStateFailure(e.toString()));
    }
  }
}
