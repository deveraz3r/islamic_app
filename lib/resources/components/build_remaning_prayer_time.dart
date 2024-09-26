import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import to format time

class BuildRemainingPrayerTime extends StatelessWidget {
  final PrayerTimes prayerTimes;
  final double radius;
  final double lineWidth;
  final Color progressColor;
  final Color backgroundColor;
  final TextStyle timeTextStyle;
  final TextStyle prayerTextStyle;

  const BuildRemainingPrayerTime({
    Key? key,
    required this.prayerTimes,
    this.radius = 80.0,
    this.lineWidth = 12.0,
    this.progressColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.timeTextStyle = const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    this.prayerTextStyle = const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();

    // List of today's prayer times and their names
    final List<Map<String, dynamic>> prayerList = [
      {'name': 'Fajr', 'time': prayerTimes.fajr},
      {'name': 'Sunrise', 'time': prayerTimes.sunrise},
      {'name': 'Dhuhr', 'time': prayerTimes.dhuhr},
      {'name': 'Asr', 'time': prayerTimes.asr},
      {'name': 'Maghrib', 'time': prayerTimes.maghrib},
      {'name': 'Isha', 'time': prayerTimes.isha},
    ];

    DateTime? currentPrayer;
    DateTime? nextPrayer;
    String nextPrayerName = '';
    String currentPrayerName = '';

    // Find the current and next prayer times
    for (int i = 0; i < prayerList.length; i++) {
      final DateTime prayerTime = prayerList[i]['time'];
      final String prayerName = prayerList[i]['name'];

      if (currentTime.isBefore(prayerTime)) {
        nextPrayer = prayerTime;
        nextPrayerName = prayerName;
        currentPrayer = i == 0 ? prayerTimes.isha : prayerList[i - 1]['time'];
        currentPrayerName = i == 0 ? 'Isha' : prayerList[i - 1]['name'];
        break;
      }
    }

    // Handle case after Isha where the next prayer is Fajr the next day
    if (nextPrayerName.isEmpty) {
      currentPrayer = prayerTimes.isha;
      nextPrayer = prayerTimes.fajr.add(Duration(days: 1));
      nextPrayerName = 'Fajr';
      currentPrayerName = 'Isha';
    }

    // Format the prayer times to only show hours and minutes
    final timeFormatter = DateFormat.jm(); // Use jm() for 12-hour format with AM/PM

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 1
          )
        ]
      ),
      child: Column(
        children: [
          Text(
            "$currentPrayerName", // Current prayer name
            style: timeTextStyle.copyWith(fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Text(
            timeFormatter.format(currentPrayer!), // Current prayer time (formatted)
            style: prayerTextStyle.copyWith(color: Colors.green, fontSize: 18), // In green
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Text(
            timeFormatter.format(nextPrayer!), // Next prayer time (formatted)
            style: prayerTextStyle.copyWith(color: Colors.red, fontSize: 18), // In red
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
