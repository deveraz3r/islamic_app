
import 'package:intl/intl.dart';
import 'package:quran_filters/utils/app_urls.dart';

class DigitalClockWidget extends StatelessWidget {
  const DigitalClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Container(
          width: width*0.5,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [primaryColor, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Text(
            // Format: 'MM/dd/yyyy hh:mm:ss'
            DateFormat(' hh : mm ').format(DateTime.now()),
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
              letterSpacing: 4,
            ),
          ),
        );
      },
    );
  }
}
