import 'package:flutter_chatgpt_getx/core/storage.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final AppStorage appStorage = Get.find<AppStorage>();

  void setLoginStatus(bool status) {
    appStorage.setBool('login', status);
  }

  void getLogInStatus() {
    appStorage.getBool('login');
  }

  void clearAll() {
    appStorage.clearAll();
  }
}
