import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_filters/models/azkar_model.dart';

class AzkarViewModel {
  late AzkarModel azkarMassa;
  late AzkarModel azkarSabah;
  late AzkarModel azkarPostPrayer;

  NamesViewModel() {
    loadNames();
  }

  Future<void> loadNames() async {
    // Load and decode the JSON files asynchronously
    String azkarMassaJsonString = await rootBundle.loadString("assets/azkar/azkar_massa.json");
    String azkarSabahJsonString = await rootBundle.loadString("assets/azkar/azkar_sabah.json");
    String azkarPostPrayerJsonString = await rootBundle.loadString("assets/azkar/PostPrayer_azkar.json");

    var azkarMassaJson = jsonDecode(azkarMassaJsonString);
    var azkarSabahJson = jsonDecode(azkarSabahJsonString);
    var azkarPostPrayerJson = jsonDecode(azkarPostPrayerJsonString);

    // Convert the JSON to model instances
    azkarMassa = AzkarModel.fromJson(azkarMassaJson);
    azkarSabah = AzkarModel.fromJson(azkarSabahJson);
    azkarPostPrayer = AzkarModel.fromJson(azkarPostPrayerJson);
  }
}