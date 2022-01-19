import 'package:flutter/material.dart';
import 'homePage.dart';
import 'cityWeather.dart';
void main() {
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        hintColor: Colors.black,

      ),
      home: HomePage(),
    );
  }
}
