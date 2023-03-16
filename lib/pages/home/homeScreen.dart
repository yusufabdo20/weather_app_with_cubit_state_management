import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search/searchScreen.dart';
import 'package:weather_app/providers/weatherProvider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  WeatherModel? weatherData;
  WeatherModelError? weatherDataError;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(child: Text("There is no weather , Searching now "))
          : Container(
              //  color: weatherData == null ? Colors.black12 : weatherData!.getThemeColor(),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                    weatherData!.getThemeColor()[300]! ,
                    weatherData!.getThemeColor()[100]! ,
                 
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                      "City: ${Provider.of<WeatherProvider>(context).cityName ?? 'No City Here'}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                  Text("   ${weatherData!.date.day} / ${weatherData!.date.month} / ${weatherData!.date.year}\n updated at ${weatherData!.date.hour} : ${weatherData!.date.minute} ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text("${weatherData!.temp.toInt()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          )),
                      Column(
                        children: [
                          Text("max: ${weatherData!.maxTemp.toInt()}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          Text("min: ${weatherData!.minTemp.toInt()}",
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
                    weatherData?.weatherStateName ?? '',
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
            ),
    );
  }
}
