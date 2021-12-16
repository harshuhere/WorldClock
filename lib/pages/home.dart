import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldclock/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(
        url: 'America/Metlakatla', location: 'Metlakatla', flag: 'india.png'),
    WorldTime(
        url: 'America/Moncton', location: 'Moncton', flag: 'south_korea.png'),
    WorldTime(url: 'America/Phoenix', location: 'Phoenix', flag: 'usa.png'),
    WorldTime(url: 'Pacific/Tahiti', location: 'Tahiti', flag: 'egypt.png'),
    WorldTime(url: 'Pacific/Wake', location: 'Wake', flag: 'uk.png'),
    WorldTime(
        url: 'Pacific/Honolulu', location: 'Honolulu', flag: 'south_korea.png'),
    WorldTime(url: 'Pacific/Chuuk', location: 'Chuuk', flag: 'uk.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'egypt.png'),
    WorldTime(url: 'Europe/Oslo', location: 'Oslo', flag: 'usa.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'indonesia.png'),
  ];
  //used object instead of map
  Map data = {};

  editlocation() async {
    dynamic index = await Navigator.pushNamed(context, '/location');
    if (index != null) {
      WorldTime instance = locations[index];
      await instance.getTime();

      setState(() {
        data = {
          'time': instance.time,
          'location': instance.location,
          'isDayTime': instance.isDayTime,
          'flag': instance.flag,
        };
      });
    }
  }

  // close app method
  Future<void> closeapp() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }

  // creating a dialog box method to show dialog box
  Future<void> _showMyDialog() async {
    showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: const Text('Exit app'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Really want to exit app ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                closeapp();
                Navigator.pop(context, true);
                // return true;
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context, false);
                // return false;
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    //set background
    String? bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return WillPopScope(
      onWillPop: () async {
        _showMyDialog();

        return false;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    editlocation();
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text('Edit Location',
                      style: TextStyle(color: Colors.grey[300])),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66.0, color: Colors.white),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
