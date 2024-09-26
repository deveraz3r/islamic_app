import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_filters/utils/routes/routes.dart';
import 'package:quran_filters/utils/app_urls.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      getPages: Routes.appRoutes(),
      // home: OnboardingView(),
    );
  }
}

