import 'package:quran_filters/resources/components/analog_clock/analog_circle.dart';
import 'package:quran_filters/resources/components/analog_clock/hour_pointer.dart';
import 'package:quran_filters/resources/components/analog_clock/min_pointer.dart';
import 'package:quran_filters/resources/components/analog_clock/sec_pointer.dart';
import 'package:quran_filters/utils/app_urls.dart';

class AnalogClockWidget extends StatelessWidget {
  const AnalogClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AnalogCircle(),
            HourPointer(),
            MinPointer(),
            SecPointer(),
            Container(
              height: 16,
              width: 16,
              decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle
              ),
            )
          ],
        );
      },
    );
  }
}
