import 'package:quran_filters/utils/app_urls.dart';

class TasbeeViewModel extends GetxController {

  RxInt counter = 0.obs;
  RxBool isGoalSet = false.obs;
  RxInt goal = (-1).obs;

  RxList<String> azkar = [
    "assets/azkar/1.png",
    "assets/azkar/2.png",
    "assets/azkar/3.png",
    "assets/azkar/4.png",
  ].obs;

  void increment(BuildContext context) {
    if(isGoalSet.value && counter.value+1 > goal.value){
      //add complete warning here
    }
    else{
      counter.value++;
    }
  }

  void reset() {
    counter.value = 0;
  }

  void setGoal(int goal){
    isGoalSet.value = true;
    this.goal.value = goal;
  }

  void resetGoal (){
    isGoalSet.value = false;
    goal.value = -1;
  }

}