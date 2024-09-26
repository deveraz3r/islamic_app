import 'package:flutter/cupertino.dart';
import 'package:quran_filters/utils/app_urls.dart';

class HomeTile extends StatelessWidget {
  HomeTile({
    super.key,
    this.height = 150,
    this.width = 150,
    this.margin,
    this.padding,
    this.beginColor,
    this.endColor,
    this.textColor = Colors.white,
    required this.tileName,
    required this.icon,
    required this.onTap,
  });

  double height;
  double width;
  Color textColor;
  Color? beginColor;
  Color? endColor;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Widget? icon;
  String tileName;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.all(2),
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [beginColor ?? primaryColor, endColor ?? Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 3,
            )
          ]),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.6,
              child: icon,
            ),
            SizedBox(
              height: height * 0.15,
            ),
            SizedBox(
                height: height * 0.2,
                child: Text(
                  tileName,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                )),
          ],
        ),
      ),
    );
  }
}
