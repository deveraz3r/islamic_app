import 'dart:async';
import 'package:quran_filters/utils/app_urls.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SplashService.initControllers();
    Timer(const Duration(seconds: 2), () => SplashService.onboardingStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.mosque, size: 200, color: Colors.white,),
            Image.asset("assets/quran.png", height: 200,),
            const SizedBox(height: 10,),
            const Text(
              "Quran Application",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32
              ),
            )
          ],
        ),
      ),
    );
  }
}