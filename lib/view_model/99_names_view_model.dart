import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_filters/models/NamesModel.dart';

class NamesViewModel {
  late AllahNames allahNames;
  late MuhammadNames muhammadNames;

  NamesViewModel() {
    loadNames();
  }

  Future<void> loadNames() async {
    // Load and decode the JSON files asynchronously
    String allahNamesJsonString = await rootBundle.loadString("assets/99_names_allah.json");
    String muhammadNamesJsonString = await rootBundle.loadString("assets/99_names_muhammad.json");

    var allahNamesJson = jsonDecode(allahNamesJsonString);
    var muhammadNamesJson = jsonDecode(muhammadNamesJsonString);

    // Convert the JSON to model instances
    allahNames = AllahNames.fromJson(allahNamesJson);
    muhammadNames = MuhammadNames.fromJson(muhammadNamesJson);
  }
}