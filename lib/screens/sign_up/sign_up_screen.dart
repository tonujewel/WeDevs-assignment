import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wedevs_assignment/screens/sign_up/sign_up_controller.dart';
import 'package:wedevs_assignment/utils/style.dart';
import 'package:wedevs_assignment/widgets/customLoader.dart';
import 'package:wedevs_assignment/widgets/customTextField.dart';
import 'package:wedevs_assignment/widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (_controller) {
          return ModalProgressHUD(
            inAsyncCall: _controller.isLoading,
            progressIndicator: CustomLoader(),
            child: Form(
              key: _signUpFormKey,
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
                                "My Account",
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
                                "SIGN UP",
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
                            controller: _controller.userNameTextController,
                            hints: "Username",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.02),
                          CustomTextField(
                            controller: _controller.emailController,
                            hints: "Email",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email required";
                              }

                              return null;
                            },
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: size.height * 0.02),
                          CustomTextField(
                            controller: _controller.passwordController,
                            hints: "Password",
                            obscure: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.04),
                          CustomButton(
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                _controller.signUpApiCall();
                              }
                            },
                            text: 'Sign Up',
                          ),
                          SizedBox(height: size.height * 0.09),
                          SizedBox(height: size.height * .02),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                "Already have an account? Sign in",
                                style: TextStyle(fontSize: 16),
                              )),
                          SizedBox(height: size.height * .1),
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
