import 'package:quran_filters/utils/app_urls.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  TextFeildController _textFeildController = Get.put(TextFeildController());
  QuranController _quranController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
          titleText: "Quran Index",
          // enableBack: true,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.home, color: Colors.white, size: 30,),
          ),
        ),
        body: Obx(
          () => Container(
            color: Utils.backGroundThemeColor(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5), spreadRadius: 1)
                      ],
                    ),
                    child: TextField(
                      controller: _textFeildController.textController,
                      focusNode: _textFeildController.focusNode,
                      enabled: !_textFeildController.isBlocked.value,
                      decoration: InputDecoration(
                        hintText: "Search by name",
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: _textFeildController.showCloseButton.value
                            ? IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  _textFeildController.disableListener();
                                  _textFeildController.focusNode.unfocus();

                                  // Reset _isBlocked after the text field loses focus
                                  Future.delayed(Duration(milliseconds: 200), () {
                                    _textFeildController.isBlocked.value = false;
                                  });
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView.separated(
                      itemCount: _quranController.surahList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            await _quranController.filterSurahs(
                                romanName: _quranController
                                    .surahList[index].surahNameRoman);
                            _quranController.pageIndex.value =
                                getSurahFirstPage(
                                    _quranController.surahList[index].surahNo);
                            _quranController.isParah.value = false;
                            Get.to(
                              () => ReadScreen(),
                            );
                          },
                          child: ListTile(
                            leading: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset("assets/quran_leaf.png"),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 30,  // Set a width limit for the text container
                                      child: Text(
                                        _quranController.surahList[index].surahNo.toString(),
                                        textAlign: TextAlign.center,  // Ensure the text is centered
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,  // Handle long text by showing ellipsis
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              _quranController.surahList[index].surahNameAr
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18, color: Utils.textThemeColor()),
                            ),
                            subtitle: Text(_quranController
                                .surahList[index].surahNameRoman
                                .toString(), style: TextStyle(color: Utils.textThemeColor().withOpacity(0.5)),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
