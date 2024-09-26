import 'package:quran_filters/utils/app_urls.dart';

class PageBuilder extends StatelessWidget {
  PageBuilder({
    super.key,
    required this.imgUrl,
    required this.header,
    required this.desc
  });

  String imgUrl;
  String header;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 80),
              alignment: Alignment.bottomCenter,
              child: Image.asset(imgUrl)
            )
          ),
          SizedBox(
            height: 50,
            child: Text(
              header,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  // color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 240,
            child: Text(
              desc,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                // color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
