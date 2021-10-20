import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/main.dart';
import 'package:wedevs_assignment/networking/api_manager.dart';
import 'package:wedevs_assignment/networking/url.dart';
import 'package:wedevs_assignment/screens/home_screen/home_screen.dart';
import 'package:wedevs_assignment/screens/login_screen/loginDm.dart';
import 'package:wedevs_assignment/utils/app_constant.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  var userNameTextController = TextEditingController();
  var passwordController = TextEditingController();

  void loginApiCall() {
    isLoading = true;
    update();

    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    APIManager.postAPICall(url: "${URL.signInURL}?username=${userNameTextController.text}&password=${passwordController.text}", header: headers).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          LoginDm loginDm = loginDmFromJson(response);
          prefs?.setString(AppConstant.USER_TOKEN_KEY, "${loginDm.token}");
          Get.offAll(() => HomeScreen());
          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        apiErrorMessage("$error");
        print("ERROR::$error");
      },
    );
  }
}
