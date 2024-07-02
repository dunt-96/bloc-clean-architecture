// // import 'package:adhan/adhan.dart';
// import 'package:adhan/adhan.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:location/location.dart';

// class PrayerTime extends StatefulWidget {
//   const PrayerTime({super.key});

//   @override
//   State<PrayerTime> createState() => _PrayerTimeState();
// }

// class _PrayerTimeState extends State<PrayerTime> {
//   final location = Location();
//   String? locationError;
//   PrayerTimes? prayerTimes;

//   @override
//   initState() {
//     super.initState();

//     getLocationData().then((locationData) {
//       print('location data $locationData');
//       if (!mounted) {
//         return;
//       }
//       setState(() {
//         prayerTimes = PrayerTimes.today(
//           Coordinates(21.010122902269273, 105.8131883637712),
//           // Coordinates(locationData!.latitude!, locationData.longitude!),
//           CalculationMethod.muslim_world_league.getParameters(),
//         );
//       });
//     });
//   }

//   Future<LocationData?> getLocationData() async {
//     var serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return null;
//       }
//     }

//     var permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return null;
//       }
//     }

//     return await location.getLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('location data ${location.getLocation()}');
//     return Builder(
//       builder: (BuildContext context) {
//         if (prayerTimes != null) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Prayer Times for Today',
//                 textAlign: TextAlign.center,
//               ),
//               Text('Fajr Time: ${DateFormat.jm().format(prayerTimes!.fajr)}'),
//               Text(
//                 'Sunrise Time: ${DateFormat.jm().format(prayerTimes!.sunrise)}',
//               ),
//               Text('Dhuhr Time: ${DateFormat.jm().format(prayerTimes!.dhuhr)}'),
//               Text('Asr Time: ${DateFormat.jm().format(prayerTimes!.asr)}'),
//               Text(
//                 'Maghrib Time: ${DateFormat.jm().format(prayerTimes!.maghrib)}',
//               ),
//               Text('Isha Time: ${DateFormat.jm().format(prayerTimes!.isha)}'),
//             ],
//           );
//         }
//         if (locationError != null) {
//           return Text(locationError ?? '');
//         }
//         return const Text('Waiting for Your Location...');
//       },
//     );
//   }
// }
