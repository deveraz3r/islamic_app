import 'package:quran_filters/utils/app_urls.dart';

class ReadScreen extends StatelessWidget {
  ReadScreen({super.key});

  QuranController _quranController = Get.find();
  ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: _quranController.filtredData[0].surahNameRoman.toString(),
        enableBack: true,
        centerTitle: true,
        actions: [
          // IconButton(
          //     onPressed: (){
          //       _quranController.toggleDisplayType();
          //     },
          //     icon: Icon(Icons.chrome_reader_mode, color: Colors.white,)
          // )
        ],
      ),
      body: Obx(
        () => Container(
          color: Utils.backGroundThemeColor(),
          child: ListView.separated(
            itemCount: _quranController.filtredData.length,
            itemBuilder: (context, index) {
              if (_quranController.filtredData[index].ayahNoSurah == 1) {
                return Column(
                  children: [_surahHeader(index), _ayahTile(index)],
                );
              } else {
                return _ayahTile(index);
              }
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ),
    );
  }

  Widget _ayahTile(int index) {
    return ListTile(
      title: Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          _quranController.filtredData[index].ayahAr.toString() + "۞",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Utils.textThemeColor()
          ),
        )
      ),
      subtitle: Text(
        _quranController.filtredData[index].ayahEn.toString(),
        style: TextStyle(
            fontSize: 12,
            color: Utils.textThemeColor().withOpacity(0.7)
        ),
      ),
    );
  }

  Widget _surahHeader(int index) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(top: 8, left: 5, right: 5),
      decoration: BoxDecoration(
          border: Border.all(color: _themeController.isDarkMode? Colors.white : Colors.black),
          color: _themeController.isDarkMode? Color(0xff313030) : greyColor,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _quranController.filtredData[index].surahNo.toString() + " ",
                style: TextStyle(
                  fontSize: 24,
                  color: Utils.textThemeColor()
                ),
              ),
              Text(
                _quranController.filtredData[index].surahNameAr.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Utils.textThemeColor()
                ),
              ),
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Utils.textThemeColor()
              ),
            )
          ),
          // Divider(),
        ],
      ),
    );
  }
}
