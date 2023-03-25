import 'package:flutter/material.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';

import '../../models/weather_model.dart';

class SearchScreen extends StatelessWidget {
  var searchCityController = TextEditingController();
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            onSaved: (value) => value?.trim(),
            controller: searchCityController,
            onFieldSubmitted: (value) async {
              cityName = value;
              WeatherCubit.get(context)
                  .getWeatherDataFromApi(cityName: cityName!);
              Navigator.pop(context);
            },
            onChanged: (value) {
              cityName = value;
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                suffixIcon: IconButton(
                  onPressed: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weatherModel =
                        await service.getWeather(cityName: cityName!);
                    WeatherCubit.get(context).weatherModelData = weatherModel;
                    WeatherCubit.get(context).cityNameCubit = cityName;
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.search),
                ),
                labelText: "Search",
                hintText: "Enter City Name",
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
        ),
      ),
    );
  }
}
