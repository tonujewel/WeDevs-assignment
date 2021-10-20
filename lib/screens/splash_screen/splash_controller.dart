import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedevs_assignment/screens/login_screen/login_screen.dart';
import '../../main.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    Timer(Duration(seconds: 3), () {
      Get.off(() => LoginScreen());
    });
    super.onInit();
  }
}
