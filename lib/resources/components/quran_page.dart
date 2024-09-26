import 'package:quran_filters/utils/app_urls.dart';

class QuranPage extends StatelessWidget {
  QuranPage({Key? key, required this.pageIndex}) : super(key: key);

  final int pageIndex;
  ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> InvertColor(
          isInvert: _themeController.isDarkMode,
          child: Image.asset(pageDir(pageIndex + 1)),
        )
    );
  }
}
