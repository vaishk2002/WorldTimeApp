import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeapp/services/world_time.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="loading";
  void setupWorldTime() async{
    WorldTime instance=WorldTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin');
    await instance.getData();
    print(instance.time);

    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  void initState() {

    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),

      ),
    );
  }
}
