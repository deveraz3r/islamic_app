class Ayah {
  final int surahNo;
  final String surahNameEn;
  final String surahNameAr;
  final String surahNameRoman;
  final int ayahNoSurah;
  final int ayahNoQuran;
  final String ayahAr;
  final String ayahEn;
  final int rukoNo;
  final int juzNo;
  final int manzilNo;
  final int hizbQuarter;
  final int totalAyahSurah;
  final int totalAyahQuran;
  final String placeOfRevelation;
  final bool sajahAyah;
  final int? sajdahNo;
  final int noOfWordAyah;
  final List<String> listOfWords;
  final String juzNameAr;
  final String juzNameRoman;

  Ayah({
    required this.surahNo,
    required this.surahNameEn,
    required this.surahNameAr,
    required this.surahNameRoman,
    required this.ayahNoSurah,
    required this.ayahNoQuran,
    required this.ayahAr,
    required this.ayahEn,
    required this.rukoNo,
    required this.juzNo,
    required this.manzilNo,
    required this.hizbQuarter,
    required this.totalAyahSurah,
    required this.totalAyahQuran,
    required this.placeOfRevelation,
    required this.sajahAyah,
    this.sajdahNo,
    required this.noOfWordAyah,
    required this.listOfWords,
    required this.juzNameAr,
    required this.juzNameRoman,
  });

  factory Ayah.fromCsv(List<dynamic> row) {
    return Ayah(
      surahNo: (row[0]),
      surahNameEn: row[1].toString(),
      surahNameAr: row[2].toString(),
      surahNameRoman: row[3].toString(),
      ayahNoSurah: (row[4]),
      ayahNoQuran: (row[5]),
      ayahAr: row[6].toString(),
      ayahEn: row[7].toString(),
      rukoNo: (row[8]),
      juzNo: (row[9]),
      manzilNo: (row[10]),
      hizbQuarter: (row[11]),
      totalAyahSurah: (row[12]),
      totalAyahQuran: (row[13]),
      placeOfRevelation: row[14].toString(),
      sajahAyah: row[15],
      sajdahNo: row[16],
      noOfWordAyah: (row[17]),
      listOfWords: _parseListOfWords(row[18].toString()),
      juzNameAr: row[19].toString(),
      juzNameRoman: row[20].toString(),
    );
  }

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      surahNo: (json['surah_no']),
      surahNameEn: json['surah_name_en'].toString(),
      surahNameAr: json['surah_name_ar'].toString(),
      surahNameRoman: json['surah_name_roman'].toString(),
      ayahNoSurah: (json['ayah_no_surah']),
      ayahNoQuran: (json['ayah_no_quran']),
      ayahAr: json['ayah_ar'].toString(),
      ayahEn: json['ayah_en'].toString(),
      rukoNo: (json['ruko_no']),
      juzNo: (json['juz_no']),
      manzilNo: (json['manzil_no']),
      hizbQuarter: (json['hizb_quarter']),
      totalAyahSurah: (json['total_ayah_surah']),
      totalAyahQuran: (json['total_ayah_quran']),
      placeOfRevelation: json['place_of_revelation'].toString(),
      sajahAyah: json['sajah_ayah'],
      sajdahNo: json['sajdah_no'],
      noOfWordAyah: (json['no_of_word_ayah']),
      listOfWords: _parseListOfWords(json['list_of_words'].toString()),
      juzNameAr: json['juz_name_ar'].toString(),
      juzNameRoman: json['juz_name_roman'].toString(),
    );
  }

  static List<String> _parseListOfWords(String value) {
    return value.replaceAll(RegExp(r'[\[\]\s]'), '').split(',');
  }
}
