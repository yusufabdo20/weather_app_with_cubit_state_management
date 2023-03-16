import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home/homeScreen.dart';
import 'package:weather_app/pages/search/searchScreen.dart';
import 'package:weather_app/providers/weatherProvider.dart';

import 'cubit/weather_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch:
                Provider.of<WeatherProvider>(context).weatherData == null
                    ? Colors.grey
                    : Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .getThemeColor()),
        home: HomeScreen(),
      ),
    );
  }
}
