import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search/searchScreen.dart';

import '../../cubit/weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  WeatherModel? weatherModelData;
  WeatherModelError? weatherDataError;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Weather"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
            body: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is GetWeatherDataLoadState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetWeatherDataSuccessState) {
                  weatherModelData = WeatherCubit.get(context).weatherModelData;
                  return SuccessState(weatherModelData: weatherModelData);
                } else if (state is GetWeatherDataFailState) {
                  return Center(child: Text("There is Error , Try Again"));
                } else {
                  // in initial state
                  return DefaultWidgetState();
                }
              },
            ));
      },
    );
  }
}

class DefaultWidgetState extends StatelessWidget {
  const DefaultWidgetState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("There is no weather , Searching now "));
  }
}

class SuccessState extends StatelessWidget {
  const SuccessState({
    Key? key,
    required this.weatherModelData,
  }) : super(key: key);

  final WeatherModel? weatherModelData;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: weatherData == null ? Colors.black12 : weatherData!.getThemeColor(),
      decoration: BoxDecoration(
        gradient: weatherModelData != null
            ? LinearGradient(
                colors: [
                  weatherModelData!.getThemeColor(),
                  weatherModelData!.getThemeColor()[300]!,
                  weatherModelData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.black12,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(weatherModelData != null?"City:":"",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
          Text(
              weatherModelData != null
                  ? "${weatherModelData!.date.day} / ${weatherModelData!.date.month} / ${weatherModelData!.date.year}\n updated at ${weatherModelData!.date.hour} : ${weatherModelData!.date.minute} "
                  : "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                  weatherModelData != null
                      ? weatherModelData!.getImage()
                      : "assets/images/noImage.png",
                  width: 100,
                  height: 100),
              Text(
                  weatherModelData != null
                      ? "${weatherModelData!.temp.toInt()}"
                      : "Try Again ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
              Column(
                children: [
                  Text(
                      weatherModelData != null
                          ? "max: ${weatherModelData!.maxTemp.toInt()}"
                          : "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Text(
                      weatherModelData != null
                          ? "min: ${weatherModelData!.minTemp.toInt()}"
                          : "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ],
              )
            ],
          ),
          const Spacer(),
          Text(
            weatherModelData?.weatherStateName ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
