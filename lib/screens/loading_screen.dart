import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import '../services/networking.dart';
import '../services/networking.dart';

const apiKey = 'c3a8954d332ec391e645c275960bfd9d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLoaction();
    latitude = location.latitude;
    longitude = location.longitude;
    print("Latitude = " + location.latitude.toString());
    print("Longitude = " + location.longitude.toString());
    NetworkHelper networkHelper = new NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
