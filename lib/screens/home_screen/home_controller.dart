import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/main.dart';
import 'package:wedevs_assignment/networking/api_manager.dart';
import 'package:wedevs_assignment/networking/url.dart';
import 'package:wedevs_assignment/screens/home_screen/userDm.dart';
import 'package:wedevs_assignment/utils/app_constant.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  var firstNameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();

  UserDm? userDm;
  String? fullName = '';

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  void getUserInfo() {
    isLoading = true;
    update();

    var headers = {'Authorization': 'Bearer ${prefs?.getString(AppConstant.USER_TOKEN_KEY)}'};

    APIManager.postAPICall(url: "${URL.userInformationURL}", header: headers).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          userDm = userDmFromJson(response);
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

  void updateUserInfo() {
    isLoading = true;
    update();

    var body = {"first_name": "${firstNameTextController.text}", "last_name": "${lastNameTextController.text}"};

    var headers = {'Authorization': 'Bearer ${prefs?.getString(AppConstant.USER_TOKEN_KEY)}', 'Content-Type': 'application/json'};

    APIManager.postAPICall(url: "${URL.updateUserInformationURL}${userDm!.id}", header: headers, body: body).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          UserDm updateUser = userDmFromJson(response);
          successSnackbar("User successfully updated");
          fullName = "${updateUser.firstName} ${updateUser.lastName}";
          firstNameTextController.clear();
          lastNameTextController.clear();
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
