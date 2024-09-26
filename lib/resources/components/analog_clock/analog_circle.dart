import 'package:quran_filters/utils/app_urls.dart';

class AnalogCircle extends StatelessWidget {
  const AnalogCircle({super.key});


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height*0.5;
    double width = MediaQuery.of(context).size.width*0.5;
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white70,
              // gradient: LinearGradient(
              //   colors: [primaryColor,Colors.green],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
              shape: BoxShape.circle
          ),
          // child: ,
        ),
      ),
    );
  }
}
