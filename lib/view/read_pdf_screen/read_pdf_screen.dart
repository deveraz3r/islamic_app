import 'package:quran_filters/models/Quran/page_data.dart';
import 'package:quran_filters/utils/app_urls.dart';

class ReadPdfScreen extends StatelessWidget {
  ReadPdfScreen({super.key});

  final QuranPdfController quran = Get.find();
  final ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Quran",
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.home, color: Colors.white, size: 30,),
        ),
        actions: [
          Obx(
                () => InkWell(
              onTap: () {
                quran.setMarker();
                print('color');
              },
              onLongPress: () {
                quran.goToPage(quran.bookMarkPage.value);
              },
              child: quran.isBookMark.value
                  ? Icon(Icons.bookmark, color: Colors.red,)
                  : Icon(Icons.bookmark, color: Colors.white,),
            ),
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView.builder(
          controller: quran.pageController,
          onPageChanged: (int newIndex) {
            quran.changePage(newIndex);
          },
          itemCount: quranPages.length,
          itemBuilder: (_, pageIndex) {
            return Obx(
                  () => Container(
                color: Utils.backGroundThemeColor(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              quran.juz.toString(),
                              style: TextStyle(color: _themeController.isDarkMode ? Colors.white : Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              quran.hizbText,
                              style: TextStyle(color: _themeController.isDarkMode ? Colors.white : Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              quran.surahName,
                              style: TextStyle(color: _themeController.isDarkMode ? Colors.white : Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    QuranPage(pageIndex: pageIndex),
                    Center(
                      child: Text(
                        (pageIndex + 1).toString(),
                        style: TextStyle(color: _themeController.isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
