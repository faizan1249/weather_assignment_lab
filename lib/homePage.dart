import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'weather.dart';

class HomePage extends StatefulWidget {
  weatherModel model = weatherModel();
  Color backgroundColor = Colors.blue;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var weatherData;
  String cityName="";
  double degree=0.0;
  void setValuesOfWeather()async
  {
    weatherData =await widget.model.getCurrentLocation();
    cityName = weatherData["name"];
    degree = weatherData['main']['temp'].round();
    print(degree);
    print(cityName);
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setValuesOfWeather();
  }
  @override



  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        body: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1513069020900-a162c4db0762?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhaW55JTIwc2t5fGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.modulate),
            ),
          ),
          child: Column(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.location_city),iconSize: 80.0,color: Colors.grey,),
              SizedBox(height: 30,),
              //RaisedButton(onPressed: setValuesOfWeather),
              Text("🌩"),
              Text("$degree°C",style: TextStyle(
                fontSize:100,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),),
              Text("$cityName",
              style: TextStyle(
                fontSize: 70,
                color: Colors.blue,
              ),),

            ],

          ),
        ),
      ),
    );
  }
}
