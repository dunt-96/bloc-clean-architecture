import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  final location = Location();
  String? locationError;
  PrayerTimes? prayerTimes;
  Coordinates? coordinates;

  late TextEditingController _latitudeControllerText;
  late TextEditingController _longtitudeControllerText;

  void getPrayerTime(Coordinates coordinates) {
    setState(
      () {
        prayerTimes = PrayerTimes(
          Coordinates(coordinates.latitude, coordinates.longitude),
          DateComponents.from(DateTime.now()),
          // Coordinates(locationData!.latitude!, locationData.longitude!),
          CalculationMethod.muslim_world_league.getParameters(),
        );
      },
    );
  }

  @override
  initState() {
    super.initState();

    getLocationData().then((locationData) {
      print('location data $locationData');
      if (!mounted) {
        return;
      }

      _latitudeControllerText =
          TextEditingController(text: locationData!.latitude.toString());
      _longtitudeControllerText =
          TextEditingController(text: locationData.longitude.toString());

      getPrayerTime(
        Coordinates(locationData.latitude!, locationData.longitude!),
      );
    });
  }

  Future<LocationData?> getLocationData() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    print('location data ${location.getLocation()}');
    return Builder(
      builder: (BuildContext context) {
        if (prayerTimes != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Prayer Times for Today',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Fajr Time: ${DateFormat.jm().format(prayerTimes!.fajr)}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Sunrise Time: ${DateFormat.jm().format(prayerTimes!.sunrise)}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Dhuhr Time: ${DateFormat.jm().format(prayerTimes!.dhuhr)}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Asr Time: ${DateFormat.jm().format(prayerTimes!.asr)}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Maghrib Time: ${DateFormat.jm().format(prayerTimes!.maghrib)}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Isha Time: ${DateFormat.jm().format(prayerTimes!.isha)}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  controller: _latitudeControllerText,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'latitude',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  controller: _longtitudeControllerText,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'longtitude',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  final a = double.parse(_latitudeControllerText.text);
                  getPrayerTime(
                    Coordinates(
                      double.parse(_latitudeControllerText.text),
                      double.parse(_longtitudeControllerText.text),
                    ),
                  );
                },
                child: const Text('Get Prayer Times'),
              ),
            ],
          );
        }
        if (locationError != null) {
          return Text(locationError ?? '');
        }
        return const Text('Waiting for Your Location...');
      },
    );
  }
}
