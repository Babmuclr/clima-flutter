import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/utilities/apikey.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    Location location = Location();
    String apikey = APIKey;

    await location.getLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    Uri url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey',
    );
    NetworkHelper networkHelper = NetworkHelper(url);
    networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
