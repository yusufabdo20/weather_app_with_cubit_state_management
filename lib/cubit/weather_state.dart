part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class GetWeatherDataSuccessState extends WeatherState {}
class GetWeatherDataFailState extends WeatherState {}
class GetWeatherDataLoadState extends WeatherState {}
