import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  WeatherModelError? _weatherDataError;
  String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData {
    return _weatherData;
  }

  set weatherDataError(WeatherModelError? weatherError) {
    _weatherDataError = weatherError;
    notifyListeners();
  }

  WeatherModelError? get weatherDataError {
    return _weatherDataError;
  }
}
