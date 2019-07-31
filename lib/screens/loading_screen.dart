import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }
  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }
   void getData() async {
     Http.Response response=await Http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
     if(response.statusCode == 200){
       String data = response.body;
       var DecodedData = jsonDecode(data);

       double temperature = DecodedData['main']['temp'];
       int condition = DecodedData['weather'][0]['id'];
       String cityname = DecodedData['name'];

       print(temperature);

     }else {
       print(response.statusCode);
     }
   }


  Widget build(BuildContext context) {
    getData();
    return Scaffold(
    );
  }
}
