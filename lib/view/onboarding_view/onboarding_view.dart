import 'package:quran_filters/utils/app_urls.dart';
import 'package:quran_filters/utils/routes/routes_name.dart';
import 'package:quran_filters/view_model/services/onboarding_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final a = Get.lazyPut(()=>OnboardingService());
  OnboardingService _onboardingController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: PageView.builder(
          controller: _onboardingController.controller,
          onPageChanged: (index){
            if(index == _onboardingController.children.length-1){
              _onboardingController.isLast.value = true;
            }
            else{
              _onboardingController.isLast.value = false;
            }
          },
          itemCount: _onboardingController.children.length,
          itemBuilder: (context, index){
            return _onboardingController.children[index];
          },
        ),
      ),
      bottomSheet: Obx(
        ()=> Container(
          color: primaryColor,
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: _onboardingController.isLast.value
            ? InkWell(
              onTap: (){
                _onboardingController.saveOnboardingStatus();
                Get.offNamed(RoutesName.homeScreen);
              },
              child: const Text(
                "Continue",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            )
            : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: _onboardingController.skip,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _onboardingController.controller,
                count: _onboardingController.children.length,
                effect: WormEffect(
                  spacing: 16,
                  activeDotColor: Colors.white
                ),
                onDotClicked: (index) => _onboardingController.onDotClicked(index),
              ),
              InkWell(
                onTap: _onboardingController.next,
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
