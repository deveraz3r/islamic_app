import 'package:adhan/adhan.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran_filters/utils/app_urls.dart';
import 'package:quran_filters/view_model/adhan_view_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

class AdhanView extends StatelessWidget {
  AdhanView({super.key});

  AdhanViewModel _adhanViewModel = Get.find();
  ThemeController _themeController = Get.find();
  HijriCalendar _today = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Prayer Timing",
        centerTitle: true,
        enableBack: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.filter_list, color: Colors.white,),
          )
        ],
      ),
      body: Container(
        color: Utils.backGroundThemeColor(),
        width: double.infinity,
        child: FutureBuilder(
          future: _adhanViewModel.getLoc(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Utils.textThemeColor(),));
            }

            //TODO: remove hardcoded values
            final myCoordinates = Coordinates(33.651823, 73.081467);
            // final myCoordinates = Coordinates(_adhanViewModel.lat!, _adhanViewModel.long!);
            final params = CalculationMethod.karachi.getParameters();
            params.madhab = _adhanViewModel.madhab=="hanafi"? Madhab.hanafi : Madhab.shafi;
            final prayerTimes = PrayerTimes.today(myCoordinates, params);

            return Obx(
                  ()=> Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container(
                  //     height: 200,
                  //     decoration: const BoxDecoration(
                  //       color: primaryColor,
                  //       image: DecorationImage(
                  //         image: AssetImage("assets/interior-masjid-nabawi.jpg"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(10.0),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //                 SizedBox(height: 30,),
                  //                 Text(
                  //                   _today.toFormat("dd, MMMM, yyyy").toString(),
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold
                  //                   ),
                  //                 ),
                  //                 SizedBox(height: 10,),
                  //                 Text(
                  //                   DateFormat('dd, MMMM, yyyy').format(DateTime.now()).toString(),
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold
                  //                   ),
                  //                 ),
                  //                 SizedBox(height: 10,),
                  //                 Text(
                  //                   "Islamabad, Pakistan",
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: width*0.45,
                  //           child: Center(child: BuildCircularProgressBar(prayerTimes: prayerTimes)),
                  //         ),
                  //       ],
                  //     )
                  // ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        _buildPrayerTime("Fajr", prayerTimes.fajr),
                        _buildPrayerTime("Sunrise", prayerTimes.sunrise),
                        _buildPrayerTime("Dhuhr", prayerTimes.dhuhr),
                        _buildPrayerTime("Asr", prayerTimes.asr),
                        _buildPrayerTime("Maghrib", prayerTimes.maghrib),
                        _buildPrayerTime("Isha", prayerTimes.isha),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPrayerTime(String prayerName, DateTime time) {
    return Card(
      elevation: 0.5,
      color: _themeController.isDarkMode? darkAltColor : Colors.white.withOpacity(0.85),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          '$prayerName',
          style: TextStyle(color: Utils.textThemeColor(), fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        trailing: Text(
          DateFormat.jm().format(time),
          style: TextStyle(color: Utils.textThemeColor(), fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }



}