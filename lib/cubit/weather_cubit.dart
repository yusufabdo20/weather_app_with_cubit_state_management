import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/services/weather_service.dart';

import '../models/weather_model.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService service;
  WeatherModel? weatherModelData;
  String? cityNameCubit;
  WeatherCubit(this.service) : super(WeatherInitial());
  static WeatherCubit get(context) => BlocProvider.of<WeatherCubit>(context);

  getWeatherDataFromApi({required String cityName}) async {
    emit(GetWeatherDataLoadState());

    try {
      weatherModelData = await service.getWeather(cityName: cityName);
      cityNameCubit = cityName;
      emit(GetWeatherDataSuccessState());
    } catch (e) {
      emit(GetWeatherDataFailState());
    }
  }
}
