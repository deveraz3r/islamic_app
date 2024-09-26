import 'dart:math';

import 'package:quran_filters/utils/app_urls.dart';

class MinPointer extends StatelessWidget {
  const MinPointer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height*0.5;
    double min = DateTime.now().minute.toDouble();
    final angle = (-pi * (min / -60) * 2);
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: Offset(0,28),
          child: Center(
            child: Container(
              height: height*0.20,
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
