import 'package:quran_filters/utils/app_urls.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPreferences();
  }

  bool get isDarkMode {
    return themeMode.value == ThemeMode.dark;
  }

  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
      saveThemeStatus("dark");
    } else {
      themeMode.value = ThemeMode.light;
      saveThemeStatus("light");
    }
  }

  Future<void> saveThemeStatus(String status) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString("theme", status);
  }

  Future<void> _loadThemeFromPreferences() async {
    final sp = await SharedPreferences.getInstance();
    String savedTheme = sp.getString("theme") ?? "light";
    if (savedTheme == "dark") {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
  }
}
