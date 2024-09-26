import 'package:quran_filters/utils/app_urls.dart';

class ReuseableElevatedbutton extends StatelessWidget {
  ReuseableElevatedbutton(
      {super.key, required this.buttonName, this.onPressed, this.width = double.infinity});

  final String buttonName;
  final VoidCallback? onPressed;
  final width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Container(
        width: width,
        height: 35,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: primaryColor,
        ),
        child: Center(child: Text(buttonName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)),
      ),
    );
  }
}

