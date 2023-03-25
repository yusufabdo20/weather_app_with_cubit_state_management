import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home/homeScreen.dart';
import 'package:weather_app/pages/search/searchScreen.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/services/weather_service.dart';

import 'cubit/weather_cubit.dart';

void main() {
  runApp(BlocProvider(create:(context) =>WeatherCubit(WeatherService()) , 
  child:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
        // theme: ThemeData(
        //     primarySwatch: WeatherCubit.get(context).weatherModel == null
        //         ? Colors.grey
        //         : WeatherCubit.get(context).weatherModel!.getThemeColor()),
      
        home: HomeScreen(),
     
    );
  }
}
 