import 'package:flutter/material.dart';
import 'package:quran_filters/resources/components/reusable_app_bar.dart';
import 'package:quran_filters/view_model/99_names_view_model.dart';
import 'package:quran_filters/utils/app_urls.dart';
import 'package:get/get.dart';

class NamesView extends StatelessWidget {
  final NamesViewModel namesViewModel = NamesViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs
      child: Scaffold(
        appBar: ReusableAppBar(
          titleText: '99 Names',
          centerTitle: true,
          enableBack: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.home, color: Colors.white, size: 30),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Utils.secondaryBackgroundThemeColor(),
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      "Allah", // Assume this exists
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 18,
                        color: Utils.textThemeColor(),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Muhammad", // Assume this exists
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 18,
                        color: Utils.textThemeColor(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 99 Names Tab
                  FutureBuilder(
                    future: namesViewModel.loadNames(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error loading names'));
                      } else {
                        return Container(
                          color: Utils.backGroundThemeColor(),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: ListView.separated(
                              itemCount: namesViewModel.allahNames.names!.length,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset("assets/quran_leaf.png"),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  width: 30,
                                                  child: Text(
                                                    '${index + 1}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              namesViewModel.allahNames.names![index].arabic.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Utils.textThemeColor(),
                                              ),
                                            ),
                                            Text(
                                              namesViewModel.allahNames.names![index].romanized.toString(),
                                              style: TextStyle(
                                                color: Utils.textThemeColor().withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  // Names of Muhammad Tab
                  FutureBuilder(
                    future: namesViewModel.loadNames(), // Assume this method exists
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error loading names'));
                      } else {
                        return Container(
                          color: Utils.backGroundThemeColor(),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: ListView.separated(
                              itemCount: namesViewModel.muhammadNames.names!.length, // Assume this list exists
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset("assets/quran_leaf.png"),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  width: 30,
                                                  child: Text(
                                                    '${index + 1}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              namesViewModel.muhammadNames.names![index].arabic.toString(), // Assume this exists
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Utils.textThemeColor(),
                                              ),
                                            ),
                                            Text(
                                              namesViewModel.muhammadNames.names![index].romanized.toString(), // Assume this exists
                                              style: TextStyle(
                                                color: Utils.textThemeColor().withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}