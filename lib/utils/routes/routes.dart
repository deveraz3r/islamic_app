import 'package:quran_filters/utils/app_urls.dart';


class Routes {

  static appRoutes() => [
      GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen()),
      GetPage(name: RoutesName.homeScreen, page: () => HomeScreen()),
      GetPage(name: RoutesName.onboarding, page: () => OnboardingView()),
      GetPage(name: RoutesName.indexScreen, page: () => IndexScreen()),
      GetPage(name: RoutesName.readScreen, page: () => ReadScreen()),
      GetPage(name: RoutesName.readPdfScreen, page: () => ReadPdfScreen()),
      GetPage(name: RoutesName.settingsScreen, page: () => SettingsScreen()),
      GetPage(name: RoutesName.compassView, page: () => CompassView()),
      GetPage(name: RoutesName.adhanView, page: () => AdhanView()),
      GetPage(name: RoutesName.tasbeeView, page: () => TasbeeView()),
      GetPage(name: RoutesName.namesView, page: () => NamesView()),
      GetPage(name: RoutesName.azkarView, page: () => AzkarView()),
  ];

}