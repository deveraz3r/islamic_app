import 'package:adhan/adhan.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quran_filters/utils/app_urls.dart';

class BuildCircularProgressBar extends StatelessWidget {
  final PrayerTimes prayerTimes;
  final double radius;
  final double lineWidth;
  final Color progressColor;
  final Color backgroundColor;
  final TextStyle timeTextStyle;
  final TextStyle prayerTextStyle;

  const BuildCircularProgressBar({
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

    // Find the current and next prayer times
    for (int i = 0; i < prayerList.length; i++) {
      final DateTime prayerTime = prayerList[i]['time'];
      final String prayerName = prayerList[i]['name'];

      if (currentTime.isBefore(prayerTime)) {
        nextPrayer = prayerTime;
        nextPrayerName = prayerName;
        currentPrayer = i == 0 ? prayerTimes.isha : prayerList[i - 1]['time'];
        break;
      }
    }

    // Handle case after Isha where the next prayer is Fajr the next day
    if (nextPrayerName.isEmpty) {
      currentPrayer = prayerTimes.isha;
      nextPrayer = prayerTimes.fajr.add(Duration(days: 1));
      nextPrayerName = 'Fajr';
    }

    // Calculate the progress and remaining time
    final totalTime = nextPrayer!.difference(currentPrayer!).inMinutes;
    final timePassed = currentTime.difference(currentPrayer).inMinutes;
    final progress = (timePassed / totalTime).clamp(0.0, 1.0);
    final remainingTimeInMinutes = nextPrayer.difference(currentTime).inMinutes;

    // Convert remaining time into hours and minutes
    final hoursLeft = remainingTimeInMinutes ~/ 60; // Integer division for hours
    final minutesLeft = remainingTimeInMinutes % 60; // Remainder for minutes

    // Ensure remainingTime is positive
    if (remainingTimeInMinutes <= 0) {
      return Text(
        "No remaining time",
        style: prayerTextStyle,
      );
    }

    return CircularPercentIndicator(
      radius: radius,
      lineWidth: lineWidth,
      percent: progress,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$hoursLeft h $minutesLeft m",
            style: timeTextStyle,
          ),
          Text(
            "left till $nextPrayerName",
            style: prayerTextStyle,
          ),
        ],
      ),
      progressColor: progressColor,
      backgroundColor: backgroundColor.withOpacity(0.7),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
