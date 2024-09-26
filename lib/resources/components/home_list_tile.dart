import 'package:flutter/material.dart';
import 'package:quran_filters/utils/app_urls.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({
    super.key,
    this.height = 60,
    this.width = double.infinity,
    this.margin,
    this.padding,
    this.beginColor,
    this.endColor,
    required this.tileName,
    required this.icon,
    required this.onTap,
  });

  final double height;
  final double width;
  final Color? beginColor;
  final Color? endColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget icon;
  final String tileName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 8),
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Utils.secondaryBackgroundThemeColor(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconTheme(
                  data: IconThemeData(color: Utils.textThemeColor()),
                  child: icon,
                ),
                const SizedBox(width: 5),
                VerticalDivider(color: Utils.textThemeColor(),),
                const SizedBox(width: 5),
                Text(
                  tileName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Utils.textThemeColor(),
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Utils.textThemeColor()),
          ],
        ),
      ),
    );
  }
}
