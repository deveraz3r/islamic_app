import 'package:quran_filters/models/Quran/page_data.dart';
import 'package:quran_filters/utils/app_urls.dart';
import 'package:flutter/material.dart';

class QuranPdfController extends GetxController {
  late SharedPreferences prefs;
  RxBool isBookMark = false.obs;
  RxInt bookMarkPage = (-1).obs;

  @override
  void onInit() {
    // sharedData();
    super.onInit();
  }

  // void sharedData() async {
  //   prefs = await SharedPreferences.getInstance();
  //   bookMarkPage.value = prefs.getInt("BookMark")!;
  // }

  // Reactive variable for current page
  RxInt currentPage = 1.obs;

  final pageController = PageController();

  int get surahNumber => quranPages[currentPage.value - 1].surah;

  String get surahName => getSurahNameArabic(surahNumber);

  int get juz => quranPages[currentPage.value - 1].juz;

  int get hizb => quranPages[currentPage.value - 1].hizb;

  int get hizbQuarter => quranPages[currentPage.value - 1].hizbQuarter;

  bool get isRightPage => currentPage.value % 2 != 0;

  String get hizbText => gethizbText(currentPage.value);

  String get surahData => getSurahDataWithName(surahNumber);

  void goToPage(int pageIndex) {
    pageController.jumpToPage(pageIndex);
    updateBookMark();
  }

  void updateBookMark() {
    isBookMark.value = prefs.getInt("BookMark") == currentPage.value;
  }

  void setMarker() {
    prefs.setInt('BookMark', currentPage.value);
    bookMarkPage.value = currentPage.value - 1;
    isBookMark.value = true;
    print(quranPages[currentPage.value - 1].surah);
    print(getSurahDataWithName(quranPages[currentPage.value - 1].surah));
  }

  void changePage(int newIndex) {
    currentPage.value = newIndex + 1;
    prefs.setInt('page', newIndex + 1);
    updateBookMark();
  }
}
