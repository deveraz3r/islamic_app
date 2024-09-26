import 'package:quran_filters/utils/app_urls.dart';

class OnboardingService extends GetxController{
  final controller = PageController();

  RxBool isLast = false.obs;

  // add the pages to children
  RxList<Widget> children = [
    PageBuilder(imgUrl: "assets/read quran.jpg", header: "Read Quran", desc: "Explore the holy Quran with easy-to-read text."),
    PageBuilder(imgUrl: "assets/tafseer.png", header: "Quran Tafseer", desc: "Understand the Quran with detailed Tafseer."),
    PageBuilder(imgUrl: "assets/qibla directions.jpg", header: "Qibla Directions", desc: "Find the direction of Qibla easily."),
    PageBuilder(imgUrl: "assets/dua.png", header: "Duas", desc: "Access a collection of essential Duas."),
  ].obs;


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void skip(){
    controller.animateToPage(
        children.length-1,
        duration: Duration(microseconds: 1000),
        curve: Curves.easeIn
    );
  }

  void next(){
    controller.nextPage(
      duration: const Duration(microseconds: 1000),
      curve: Curves.easeIn
    );
  }

  void onDotClicked(int index){
    controller.animateToPage(
      index,
      duration: const Duration(microseconds: 1000),
      curve: Curves.easeIn
    );
  }

  Future<void> saveOnboardingStatus() async{
    final sp = await SharedPreferences.getInstance();
    sp.setBool("onboarding", true);
  }

  Future<bool> getOnboardingStatus() async{
    final sp = await SharedPreferences.getInstance();
    bool onboardingStatus = sp.getBool("onboarding") ?? false;
    return onboardingStatus;
  }

}