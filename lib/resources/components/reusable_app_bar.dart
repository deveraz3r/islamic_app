import 'package:quran_filters/utils/app_urls.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  ReusableAppBar({
    super.key,
    required this.titleText,
    this.leading,
    this.centerTitle = false,
    this.actions,
    this.enableBack = false,
    this.appBarTitle,
    this.bottom,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String titleText;
  bool centerTitle;
  List<Widget>? actions;
  bool enableBack;
  Widget? leading;
  Widget? appBarTitle;
  TabBar? bottom;

  Widget _backButton = IconButton(
      onPressed: (){
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      )
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: enableBack? _backButton : leading,
      centerTitle: centerTitle,
      title: appBarTitle ?? Text(
          titleText,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white
          )
      ),
      actions: actions,
      bottom: bottom,
    );
  }
}
