// import 'package:permission_handler/permission_handler.dart';
// import 'package:quran_filters/utils/app_urls.dart';
// import 'package:quran_filters/view_model/qiblah_compass_view_model.dart';
//
// class QiblahCompassView extends StatelessWidget {
//   QiblahCompassView({super.key});
//
//   final QiblahCompassViewModel _compassView = Get.put(QiblahCompassViewModel());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _compassView.getPermission(),
//         builder: (context, snapshot) {
//           if(_compassView.hasPermission.value){
//             return const CompassView();
//           }
//           else{
//             return const Center(child: Text("Permission denied"),);
//           }
//         },
//       ),
//     );
//   }
// }
