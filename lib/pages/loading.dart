import 'package:flutter/material.dart';
import 'package:flutter_app2/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Delhi', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitChasingDots(
      color: Colors.white,
      size: 50.0,
    );

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        spinkit,
        SizedBox(height: 14),
        Text('Loading...',
            style: TextStyle(
                fontSize: 16, color: Colors.white, letterSpacing: 2.0))
      ])),
    );
  }
}
