//
// import 'package:quran_filters/utils/app_urls.dart';
//
//
// class QiblahCompassViewModel extends GetxController {
//
//   RxBool hasPermission = false.obs;
//
//   Future getPermission() async {
//     if(await Permission.location.serviceStatus.isEnabled){
//       var status = await Permission.location.status;
//       if(status.isGranted){
//         hasPermission.value = true;
//       }
//       else{
//         Permission.location.request().then((value) {
//           hasPermission.value = (value == PermissionStatus.granted);
//         });
//       }
//     }
//   }
//
// }