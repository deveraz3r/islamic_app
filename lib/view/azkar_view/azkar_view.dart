import 'package:quran_filters/models/azkar_model.dart';
import './../../utils/app_urls.dart';

class AzkarView extends StatelessWidget {
  final AzkarViewModel azkarViewModel = AzkarViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: ReusableAppBar(
            titleText: 'Azkar',
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
                        "أذكار المساء",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Utils.textThemeColor(),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "أذكار الصباح",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Utils.textThemeColor(),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "أذكار بعد الصلاة",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Utils.textThemeColor(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: azkarViewModel.loadNames(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading names'));
                  } else {
                    return Expanded(
                      child: TabBarView(
                        children: [
                          _azkarBuilder(azkarViewModel.azkarMassa), // Massa
                          _azkarBuilder(azkarViewModel.azkarSabah), // Sabah
                          _azkarBuilder(azkarViewModel.azkarPostPrayer), // Post Prayer
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          )),
    );
  }

  Widget _azkarBuilder(AzkarModel _azkar) {
    return Container(
      color: Utils.backGroundThemeColor(),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: _azkar.content!.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _azkar.content![index].zekr.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Utils.textThemeColor(),
                    ),
                  ),
                  Text(
                    "Repeat: ${_azkar.content![index].repeat}",
                    style: TextStyle(
                      color: Utils.textThemeColor().withOpacity(0.5),
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
}
