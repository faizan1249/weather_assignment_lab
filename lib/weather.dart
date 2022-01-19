import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:geolocator/geolocator.dart';
import 'networking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



const API_KEY="9e486b96944d415db8c0f96f80885807";
const api_url = "api.openweathermap.org/data/2.5/weather?";



class weatherModel {
  double longitude= 0.0;
  double lattitude = 0.0;

  Future<dynamic> getCurrentLocation() async{
    Position position = await
      Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    longitude = position.longitude;
    lattitude = position.latitude;

    print(longitude);
    print(lattitude);

    var weatherData=await getWeatherData();
    return weatherData;
  }

  Future<dynamic> getWeatherData()async
  {
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lattitude&lon=$longitude&appid=$API_KEY&units=metric");
    print(url);
    var response = await http.get(url);
    var weatherData = await getJSONDdata(response);
    return weatherData;
    print(weatherData['coord']['lon']);
    String cityName = weatherData['name'];
    print(cityName);

  }
  Future<dynamic> getJSONDdata(var response) async
  {
    String data =(response.body);
    if(response.statusCode==200)
      {
        var weatherData = jsonDecode(data);
        print(weatherData);
        return weatherData;
      }
    else{
      print("No Data");
    }



  }


}