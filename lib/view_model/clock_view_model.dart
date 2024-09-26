import 'package:get/get.dart';
import 'package:quran_filters/utils/app_urls.dart';

class ClockViewModel extends GetxController{
  RxList<bool> isSelected = [
    false,
    false,
    false
  ].obs;

  @override
  void onInit() {
    initIsLoading();
    super.onInit();
  }

  void initIsLoading() async {
    switch(await getClockState()){
    case "off":
    isSelected[0]=true;
    break;
    case "analog":
    isSelected[1]=true;
    break;
    case "digital":
    isSelected[2]=true;
    break;
    }
  }

  Future<void> saveClockState(String state) async{
    final sp = await SharedPreferences.getInstance();
    sp.setString("clockState", state);
  }

  Future<String> getClockState() async{
    final sp = await SharedPreferences.getInstance();
    String? clockStatus = sp.getString("clockState") ?? "off";
    return clockStatus;
  }

  void changeState() {
    if(isSelected[0]){
      saveClockState("off");
    }
    else if(isSelected[1]){
      saveClockState("analog");
    }
    else if(isSelected[2]){
      saveClockState("digital");
    }
  }
}