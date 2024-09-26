import 'dart:async';

import 'package:quran_filters/utils/app_urls.dart';
import 'package:quran_filters/utils/routes/routes_name.dart';
import 'package:quran_filters/view_model/services/onboarding_service.dart';
import 'package:quran_filters/view_model/tasbee_view_model.dart';

class SplashService {

  static initControllers(){
    Get.put(QuranController(), permanent: true);
    Get.put(QuranPdfController(), permanent: true);
    Get.put(ThemeController(), permanent: true);
    Get.put(ClockViewModel(), permanent: true);
    Get.put(AdhanViewModel(), permanent: true);
    Get.put(TasbeeViewModel(), permanent: true);
    Timer(
      const Duration(seconds: 3),
        (){},
    );
  }

  static onboardingStatus() async{
    OnboardingService _onboarding = Get.put(OnboardingService());
    // SharedPreferences.setMockInitialValues({"onboarding": false});
    bool onboardingStatus = await _onboarding.getOnboardingStatus();

    onboardingStatus
    ? Get.offNamed(RoutesName.homeScreen)
    : Get.offNamed(RoutesName.onboarding);
  }

}