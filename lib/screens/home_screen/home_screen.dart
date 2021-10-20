import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wedevs_assignment/utils/style.dart';
import 'package:wedevs_assignment/widgets/customLoader.dart';
import 'package:wedevs_assignment/widgets/customTextField.dart';
import 'package:wedevs_assignment/widgets/custom_button.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<FormState> _homeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_controller) {
          return ModalProgressHUD(
            inAsyncCall: _controller.isLoading,
            progressIndicator: CustomLoader(),
            child: Form(
              key: _homeFormKey,
              child: Scaffold(
                backgroundColor: Style.primaryColor,
                body: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: size.height * .3,
                      child: Column(
                        children: [
                          SizedBox(height: size.height * .025),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome ${_controller.fullName}",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .18,
                            child: Center(
                              child: Image.asset(
                                'assets/image/small_logo.png',
                                height: size.height * .1,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Update your profile",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .7,
                      padding: EdgeInsets.only(left: size.width * .08, right: size.width * .08),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextField(
                            controller: _controller.firstNameTextController,
                            hints: "First Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First Name required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.02),
                          CustomTextField(
                            controller: _controller.lastNameTextController,
                            hints: "Last Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last Name required";
                              }
                              return null;
                            },
                            inputType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: size.height * 0.04),
                          CustomButton(
                            onTap: () {
                              if (_homeFormKey.currentState!.validate()) {
                                _controller.updateUserInfo();
                              }
                            },
                            text: 'Update',
                          ),
                          SizedBox(height: size.height * 0.09),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
