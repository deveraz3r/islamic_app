import 'app_urls.dart';

class Utils{

  static Color textThemeColor() {
    ThemeController themeController = Get.find();
    return themeController.isDarkMode? Colors.white : Colors.black;
  }

  static bool isDarkTheme() {
    ThemeController themeController = Get.find();
    return themeController.isDarkMode;
  }

  static Color secondaryBackgroundThemeColor() {
    ThemeController themeController = Get.find();
    return themeController.isDarkMode? darkAltColor : Colors.white.withOpacity(0.85);
  }

  static Color backGroundThemeColor() {
    ThemeController themeController = Get.find();
    return themeController.isDarkMode? darkBackgroundColor : backgroundColor;
  }

}