import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    getNetwork getnetwork = getNetwork('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey');
    var weatherdata = await getnetwork.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(Locationweather: weatherdata,);
    }));
  }




  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}