import 'package:flutter/material.dart';

class CityWeather extends StatefulWidget {
  const CityWeather({Key? key}) : super(key: key);

  @override
  _CityWeatherState createState() => _CityWeatherState();
}

class _CityWeatherState extends State<CityWeather> {
  String cityName="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.pexels.com/photos/4297438/pexels-photo-4297438.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            fit: BoxFit.fill,
          ),

        ),
        child:Column(
          children: [
            Container(
              width: 250,
              child: TextField(
                onChanged: (value){
                  setState(() {
                    cityName = value;

                  });
                },

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
                decoration: InputDecoration(
                  hintText: "Please Enter City Name",
                  fillColor: Colors.grey,
                  filled: true,
                  prefixIcon: Icon(Icons.location_city,
                  color: Colors.black26,),
                  border: OutlineInputBorder(
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 40,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: ElevatedButton(
                    child: Text("Get Weather",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),),
                    onPressed: (){},
                  ),
                ),
              ),
            ),


          ],
        ),
      )
    );
  }
}
