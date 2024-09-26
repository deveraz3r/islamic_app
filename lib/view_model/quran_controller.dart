import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_filters/models/surah.dart';

enum FilterType { surahIndex, surahAyahs, parahIndex, parahAyahs }


// TODO: remove para search functions
class QuranController extends GetxController {
  List<Ayah> data = [];
  RxList<dynamic> filtredData = [].obs;
  RxList<dynamic> surahList = [].obs;
  RxList<dynamic> parahList = [].obs;
  FilterType filterType = FilterType.surahIndex;
  RxList<dynamic> pageData = [].obs;
  RxString displayType = "list".obs;
  RxInt pageIndex = (-1).obs;
  RxBool isParah = false.obs;

  @override
  void onInit() async {
    await loadData();
    await loadSurahList();
    await loadParahs();
    super.onInit();
  }

  //loads data from csv to model
  Future<void> loadData() async {
    final _rawData = await rootBundle.loadString('assets/QuranDB.json');

    List _jsonData = json.decode(_rawData);

    for(var _data in _jsonData){
      data.add(Ayah.fromJson(_data));
    }

    print("Ayahs loaded: ${data.length}");
  }

  Future<void> loadSurahList() async {
    surahList = [].obs;
    // surahList.clear();
    filterType = FilterType.surahIndex;

    String prevSurahName = data[0].surahNameAr;
    surahList.add(data[0]);

    for (var _data in data) {
      if (_data.surahNameAr != prevSurahName) {
        prevSurahName = _data.surahNameAr;
        surahList.add(_data);
      }
    }

    print("Successfully loaded ${surahList.length} surahs");
  }

  void loadPage() {
    // pageData = "".obs;
    // for (var _data in filtredData) {
    //   pageData.value += _data.ayahAr + " ۞ ";
    // }
  }

  Future<void> filterSurahs({required String romanName}) async {
    filterType = FilterType.surahAyahs;
    filtredData.clear();

    List<Ayah> _filter =
        data.where((element) => element.surahNameRoman == romanName).toList();

    for (var _data in _filter) {
      filtredData.add(_data);
    }
    loadPage();
  }

  Future<void> loadParahs() async {
    parahList.clear();
    parahList = [].obs;
    filterType = FilterType.surahIndex;

    Set<int> uniqueParahs = {};

    for (var _data in data) {
      if (uniqueParahs.add(_data.juzNo)) {
        parahList.add(_data);
      }
    }

    print("Sucessfully loaded ${parahList.length} parahs");
  }

  Future<void> filterParahs({required int index}) async {
    List<Ayah> _filter =
        data.where((element) => element.juzNo == index).toList();

    filtredData.clear();
    filterType = FilterType.parahAyahs;

    for (var _data in _filter) {
      filtredData.add(_data);
    }
    loadPage();
  }

  Future<void> filterParahIndex() async {}

  Future<void> searchBySurahName({required String surahNameRoman}) async {
    List<Ayah> _filter = data
        .where((element) => element.surahNameRoman
            .toLowerCase()
            .contains(surahNameRoman.toLowerCase()))
        .toList();

    surahList.clear();
    surahList = [].obs;
    filterType = FilterType.surahIndex;

    Set<String> uniqueNames = {};

    for (var _data in _filter) {
      if (uniqueNames.add(_data.surahNameRoman)) {
        surahList.add(_data);
      }
    }
  }

  Future<void> searchByParahName({required String parahNameRoman}) async {
    List<Ayah> _filter = data
        .where((element) => element.juzNameRoman
        .toLowerCase()
        .contains(parahNameRoman.toLowerCase()))
        .toList();

    parahList.clear();
    parahList = [].obs;
    filterType = FilterType.surahIndex;

    Set<String> uniqueNames = {};

    for (var _data in _filter) {
      if (uniqueNames.add(_data.juzNameRoman)) {
        parahList.add(_data);
      }
    }
  }

  Future<void> searchByParahNo({required int parahNo}) async {
    List<Ayah> _filter = data.where((element) => element.juzNo.toString().contains(parahNo.toString())).toList();

    parahList.clear();
    parahList = [].obs;
    filterType = FilterType.surahIndex;

    Set<int> uniqueParahs = {};

    for (var _data in _filter) {
      if (uniqueParahs.add(_data.juzNo)) {
        parahList.add(_data);
      }
    }
  }

  List<List<Ayah>> segmentFiltredSurahs() {
    List<List<Ayah>> segmentedSurahs = [];

    if (filtredData.isEmpty) [];

    String currentSurah = filtredData[0].surahNameAr;
    List<Ayah> currentSurahList = [];

    for (var _data in filtredData) {
      if (_data.surahNameAr == currentSurah) {
        currentSurahList.add(_data);
      } else {
        // Save the current list to segmentedSurahs
        segmentedSurahs.add(currentSurahList);

        // Start a new list for the new surah
        currentSurah = _data.surahNameAr;
        currentSurahList = [_data];
      }
    }

    // Add the last accumulated list
    if (currentSurahList.isNotEmpty) {
      segmentedSurahs.add(currentSurahList);
    }

    // Now segmentedSurahs contains lists of surahs as required
    print("Segmented Surahs: ${segmentedSurahs.length}");

    return segmentedSurahs;
  }

  void combineSurahs(List<List<Ayah>> list) {
    // pageData = [].obs;
    // for (var listData in list) {
    //   for()
    //   // pageData.value += _data.ayahAr + " ۞ ";
    // }
  }

  void toggleDisplayType() {
    if(displayType.value=="list"){
      displayType.value ="paragraph";
    }
    else{
      displayType.value = "list";
    }
  }
}
