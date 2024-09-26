import 'package:quran_filters/utils/app_urls.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  ThemeController _themeController = Get.find();

  ClockViewModel _clockViewModel = Get.find();

  AdhanViewModel _adhanViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Settings",
        centerTitle: true,
        enableBack: true,
      ),
      body: Obx(
        ()=> Container(
          color: Utils.backGroundThemeColor(),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "App Theme",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Utils.textThemeColor()
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      _themeController.toggleTheme();
                    },
                    icon: Obx(() => _themeController.isDarkMode
                      ? Icon(Icons.light_mode_rounded, color: secondaryColor,)
                      : Icon(Icons.dark_mode, color: Colors.pink,)
                    )
                ),
              ),
              // const Divider(),
              // ListTile(
              //   title: Text(
              //     "Clock",
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18,
              //         color: Utils.textThemeColor()
              //     ),
              //   ),
              //   trailing: ToggleButtons(
              //     isSelected: _clockViewModel.isSelected,
              //     fillColor: primaryColor,
              //     borderColor: Get.find<ThemeController>().isDarkMode? Colors.white : Colors.grey,
              //     selectedBorderColor: Get.find<ThemeController>().isDarkMode? Colors.white : Colors.grey.shade300,
              //     borderRadius: BorderRadius.circular(15),
              //     onPressed: (index) {
              //       for(int i=0; i<_clockViewModel.isSelected.length; i++){
              //         _clockViewModel.isSelected[i] = false;
              //       }
              //       _clockViewModel.isSelected[index] = true;
              //       _clockViewModel.changeState();
              //     },
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Text("Off", style: TextStyle(color: _clockViewModel.isSelected[0]?Colors.white : Utils.textThemeColor()),),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Text("Analog", style: TextStyle(color: _clockViewModel.isSelected[1]?Colors.white : Utils.textThemeColor())),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Text("Digital", style: TextStyle(color: _clockViewModel.isSelected[2]?Colors.white : Utils.textThemeColor())),
              //       )
              //     ],
              //   )
              // ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Madhab:',
                      style: TextStyle(color: Utils.textThemeColor(), fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    DropdownButton(
                        items: [
                          DropdownMenuItem(child: Text("Hanafi", style: TextStyle(color: Utils.textThemeColor()),), value: "hanafi"),
                          DropdownMenuItem(child: Text("Shafi", style: TextStyle(color: Utils.textThemeColor())), value: "shafi"),
                        ],
                        dropdownColor: Utils.secondaryBackgroundThemeColor(),
                        value: _adhanViewModel.madhab.value,
                        onChanged: (value){
                          _adhanViewModel.setMadhab(value!);
                        }
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
