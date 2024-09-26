import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran_filters/utils/app_urls.dart';
import '../../resources/components/build_circular_progressBar.dart';
import '../../resources/components/build_remaning_prayer_time.dart';
import '../../view_model/services/alarm_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ClockViewModel _clockViewModel = Get.find();
  final AdhanViewModel _adhanViewModel = Get.find();
  final ThemeController _themeController = Get.find();
  HijriCalendar _today = HijriCalendar.now();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    //TODO: remove hardcoded values
    final myCoordinates = Coordinates(33.651823, 73.081467);
    // final myCoordinates = Coordinates(_adhanViewModel.lat!, _adhanViewModel.long!);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab =
    _adhanViewModel.madhab == "hanafi" ? Madhab.hanafi : Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    return Obx(
          () => Scaffold(
        key: _key,
        appBar: ReusableAppBar(
          leading: IconButton(
              onPressed: () => {_key.currentState!.openDrawer()},
              icon: Icon(
                Icons.list_outlined,
                color: Colors.white,
              )),
          titleText: "Quran Application",
          centerTitle: true,
        ),
        body: Obx(
              () => Container(
            color: Utils.backGroundThemeColor(),
            // padding: const EdgeInsets.all(20.0),
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height*0.35,
                    //   child: Center(
                    //     child: clock()
                    //   )
                    // ),
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/interior-masjid-nabawi.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          // SizedBox(width: 3,),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: new BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              _today
                                                  .toFormat("dd, MMMM, yyyy")
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          // SizedBox(width: 3,),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: new BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              DateFormat('dd, MMMM, yyyy')
                                                  .format(DateTime.now())
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          // SizedBox(width: 3,),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          const Expanded(
                                            child: Text(
                                              "Islamabad, Pakistan",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.45,
                                child: Center(
                                    child: StreamBuilder(
                                        stream: Stream.periodic(
                                            const Duration(seconds: 1)),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState !=
                                              ConnectionState.done) {
                                            // return BuildCircularProgressBar(
                                            //     prayerTimes: prayerTimes);
                                            return BuildRemainingPrayerTime(
                                              prayerTimes: prayerTimes
                                            );
                                          } else {
                                            return const CircularProgressIndicator();
                                          }
                                        })),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 70,
                          )
                        ],
                      )
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 180, left: 25, right: 25),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  // height: height*0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                    color: _themeController.isDarkMode
                        ? const Color(0xff525050)
                        : const Color(0xD0C5C5CC)
                  ),
                  child: Expanded(
                    child: ListView(
                      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 2,
                      //   mainAxisSpacing: 10,
                      //   crossAxisSpacing: 10
                      // ),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        HomeListTile(
                            tileName: "Read Quran",
                            icon: const Icon(
                              Icons.menu_book,
                              size: 35,
                            ),
                            onTap: () => Get.to(() => IndexScreen())),
                        const SizedBox(height: 10),
                        HomeListTile(
                            tileName: "Quran Pdf",
                            icon: const Icon(
                              Icons.chrome_reader_mode_sharp,
                              size: 35,
                            ),
                            onTap: () => Get.to(() => ReadPdfScreen())),
                        const SizedBox(height: 10),
                        HomeListTile(
                          tileName: "Qibla Direction",
                          icon: Image.asset(
                            "assets/qibla direction.png",
                            color: Utils.textThemeColor(),
                          ),
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                          onTap: () => Get.toNamed(RoutesName.compassView),
                        ),
                        const SizedBox(height: 10),
                        HomeListTile(
                            tileName: "Prayer Timing",
                            icon: Image.asset(
                              "assets/prayer_vector.png",
                              color: Utils.textThemeColor(),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 14),
                            onTap: () => Get.toNamed(RoutesName.adhanView)),
                        const SizedBox(height: 10),
                        HomeListTile(
                            tileName: "Tasabee",
                            icon: Image.asset(
                              "assets/tasbeeh_vector.png",
                              // color: Utils.textThemeColor(),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 14),
                            onTap: () => Get.toNamed(RoutesName.tasbeeView)),
                        const SizedBox(height: 10),
                        HomeListTile(
                            tileName: "Azkar",
                            icon: Icon(Icons.crop_square_sharp, ),
                            onTap: ()=> Get.toNamed(RoutesName.azkarView)
                        ),
                        const SizedBox(height: 10),
                        HomeListTile(
                            tileName: "99 Names",
                            icon: Icon(Icons.account_circle_rounded, ),
                            onTap: ()=> Get.toNamed(RoutesName.namesView)
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: _themeController.isDarkMode
                ? Color(0xff525050)  // Dark mode color
                : Color(0xD0C5C5CC), // Light mode color
          ),
          child: Drawer(
            child: Column(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: primaryColor),
                  child: Center(
                    child: Text(
                      "Junaid Ahmed",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode, color: Colors.grey,),
                  title: const Text(
                    "Dark Mode",
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  trailing: CupertinoSwitch(
                    activeColor: secondaryColor,
                    value: _themeController.isDarkMode,
                    onChanged: (value) => _themeController.toggleTheme()
                  )
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About"),
                ),
                InkWell(
                  onTap: () => Get.toNamed(RoutesName.settingsScreen),
                  child: const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Setting"),
                  ),
                ),
                const Spacer(), // This pushes the version text to the bottom
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Version 1.0.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //function removed
  Widget _clock() {
    if (_clockViewModel.isSelected[0]) {
      return Image.asset("assets/read quran.jpg");
    } else if (_clockViewModel.isSelected[1]) {
      return AnalogClockWidget();
    } else if (_clockViewModel.isSelected[2]) {
      return DigitalClockWidget();
    } else {
      return Text("error");
    }
  }

}
