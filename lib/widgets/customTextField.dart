import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_assignment/utils/style.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hints;
  TextInputType? inputType;
  bool? obscure = false;
  FormFieldValidator<String>? validator;

  CustomTextField({
    required this.controller,
    required this.hints,
    this.inputType,
    this.obscure,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Style.cursorColor,
      textInputAction: TextInputAction.next,
      keyboardType: inputType == null ? TextInputType.text : inputType,
      controller: controller,
      validator: validator,
      obscureText: obscure ?? false,
      style: TextStyle(color: Style.textColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.03, vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Style.primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color:  Style.primaryColor),
        ),
        labelText: hints,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xff747D8C),
        ),
      ),
    );
  }
}
