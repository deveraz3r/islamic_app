import 'dart:math';

import 'package:quran_filters/utils/app_urls.dart';

class HourPointer extends StatelessWidget {
  const HourPointer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height*0.5;
    double width = MediaQuery.of(context).size.width*0.5;
    double hour = DateTime.now().hour.toDouble();
    final angle = (-pi * (hour / -12) * 2);
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: Offset(0,20),
          child: Center(
            child: Container(
              height: height*0.1,
              width: 4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(32)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
