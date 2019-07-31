import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'f814ce45204a4cedecbcfceecb88cf88';
double lon;
double lat;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    lat=location.latitude;
    lon=location.longitude;

    getNetwork getnetwork = getNetwork('https://openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey');
    var weatherdata = await getnetwork.getData();
  }




  Widget build(BuildContext context) {
    return Scaffold();
  }
}