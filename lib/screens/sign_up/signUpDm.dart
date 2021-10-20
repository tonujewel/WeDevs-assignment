// To parse this JSON data, do
//
//     final signUpDm = signUpDmFromJson(jsonString);

import 'dart:convert';

SignUpDm signUpDmFromJson(String str) => SignUpDm.fromJson(json.decode(str));

String signUpDmToJson(SignUpDm data) => json.encode(data.toJson());

class SignUpDm {
  SignUpDm({
    this.code,
    this.message,
  });

  int? code;
  String? message;

  factory SignUpDm.fromJson(Map<String, dynamic> json) => SignUpDm(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
