import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
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

  Future<void> updateTime(index) async {
    Navigator.pop(context, index);
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location!),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
