import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/services/weather_service.dart';

import '../../models/weather_model.dart';

class SearchScreen extends StatelessWidget {
  var searchCityController = TextEditingController();
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            controller: searchCityController,
            
            onFieldSubmitted: (value) async {
              cityName = value;
              WeatherService service = WeatherService();
              WeatherModel? weatherModel =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            onChanged: (value) {
              cityName = value;
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                suffixIcon: IconButton(
                  onPressed: () async{
                     WeatherService service = WeatherService();
              WeatherModel? weatherModel =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
                  },
                  icon: Icon(Icons.search),
                ),
                labelText: "Search",
                hintText: "Enter City Name",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
        ),
      ),
    );
  }
}
