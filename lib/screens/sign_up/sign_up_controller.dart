import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/networking/api_manager.dart';
import 'package:wedevs_assignment/networking/url.dart';
import 'package:wedevs_assignment/screens/sign_up/signUpDm.dart';
import 'package:wedevs_assignment/utils/app_constant.dart';

class SignUpController extends GetxController {
  bool isLoading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameTextController = TextEditingController();

  void signUpApiCall() async {
    isLoading = true;
    update();

    var body = {"username": "${userNameTextController.text}", "email": "${emailController.text}", "password": "${passwordController.text}"};
    var headers = {'Content-Type': 'application/json'};

    APIManager.postAPICall(url: URL.signUpURL, body: body, header: headers).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          SignUpDm signUpDm = signUpDmFromJson(response);
          Get.back();
          successSnackbar('${signUpDm.message}');
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
