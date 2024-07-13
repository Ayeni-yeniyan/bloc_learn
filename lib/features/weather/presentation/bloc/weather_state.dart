part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherStateLoading extends WeatherState {}

final class WeatherStateFailure extends WeatherState {
  final String error;
  WeatherStateFailure(this.error);
}

final class WeatherStateSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherStateSuccess(this.weatherModel);
}
