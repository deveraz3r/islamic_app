import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_filters/utils/app_urls.dart';
import 'package:quran_filters/view_model/tasbee_view_model.dart';

class TasbeeView extends StatelessWidget {
  TasbeeView({super.key});

  TasbeeViewModel _tasbeeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Tasbee",
        centerTitle: true,
        enableBack: true,
      ),
      body: Obx(
            () => Container(
          color: Utils.backGroundThemeColor(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // // Set Goal Section
              // Padding(
              //   padding: const EdgeInsets.only(top: 20.0),
              //   child: Text(
              //     "Set Goal:",
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       color: Utils.textThemeColor(), // Change text color
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 115,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Utils.secondaryBackgroundThemeColor(),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number, // Only accepts numbers
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Set Target?',
                            hintStyle: TextStyle(color: Utils.textThemeColor()), // Hint text color
                          ),
                          onChanged: (value) {

                          },
                        ),
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.check, color: Utils.textThemeColor()), // Change icon color
                    //   onPressed: () {
                    //
                    //   },
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.35,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Utils.secondaryBackgroundThemeColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: PageView.builder(
                        itemCount: _tasbeeViewModel.azkar.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            _tasbeeViewModel.azkar[index].toString(),
                            color: Utils.textThemeColor(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 0,),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset("assets/tasbeeh_vector.png"),
                      Column(
                        children: [
                          const SizedBox(height: 45,),
                          SizedBox(
                            height: 60,
                            width: 160,
                            child: Text(
                              _tasbeeViewModel.counter.toString(),
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Digital7",
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          SizedBox(
                            height: 65,
                            width: 160,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 130, top: 40),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Reset Counter"),
                                        content: const Text("Are you sure you want to reset the counter?"),
                                        actions: [
                                          TextButton(
                                            child: const Text(
                                              "No",
                                              style: TextStyle(color: primaryColor),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text(
                                              "Yes",
                                              style: TextStyle(color: primaryColor),
                                            ),
                                            onPressed: () {
                                              _tasbeeViewModel.reset();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const SizedBox(),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: InkWell(
                              onTap: () {
                                _tasbeeViewModel.increment(context);
                              },
                              child: const SizedBox(
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
