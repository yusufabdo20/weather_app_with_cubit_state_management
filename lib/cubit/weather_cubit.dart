
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/services/weather_service.dart';

import '../models/weather_model.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static Cubit get (context)=> BlocProvider.of(context) ;
  WeatherModel? weatherModel ;
  

  }


