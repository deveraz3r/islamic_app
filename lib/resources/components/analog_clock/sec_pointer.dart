import 'dart:math';

import 'package:quran_filters/utils/app_urls.dart';

class SecPointer extends StatelessWidget {
  const SecPointer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height*0.5;
    double sec = DateTime.now().second.toDouble();
    final angle = (-pi * (sec / -60) * 2);
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: Offset(0,30),
          child: Center(
            child: Container(
              height: height*0.24,
              width: 4,
              decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(32)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
