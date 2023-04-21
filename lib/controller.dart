import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

import 'package:geolocator/geolocator.dart';

class Controller extends GetxController {
  static Controller get to => Get.find<Controller>();

  RxBool isLoading = false.obs;

  void onInit() async {
    //권한 체크

    await locationPermission();
  }

  Future<void> locationPermission() async {
    Map<Permission, PermissionStatus> status =
        await [Permission.location].request();

    if (status[Permission.location] == PermissionStatus.granted) {
      await getLocation();
    } else if (status[Permission.location] == PermissionStatus.denied) {
      await locationPermission();

      if (status[Permission.location] == PermissionStatus.granted) {
        await getLocation();
      } else {
        print('failed');
      }
    }
  }

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print('failed getting the current location');
    }
  }
}
