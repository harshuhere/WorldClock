import 'package:flutter/material.dart';

import 'package:worldclock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenLoading extends StatefulWidget {
  const ScreenLoading({Key? key}) : super(key: key);

  @override
  _ScreenLoadingState createState() => _ScreenLoadingState();
}

class _ScreenLoadingState extends State<ScreenLoading> {
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  Future<void> setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    var result = Navigator.pushNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
