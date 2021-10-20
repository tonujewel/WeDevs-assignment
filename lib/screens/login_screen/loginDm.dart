// To parse this JSON data, do
//
//     final loginDm = loginDmFromJson(jsonString);

import 'dart:convert';

LoginDm loginDmFromJson(String str) => LoginDm.fromJson(json.decode(str));

String loginDmToJson(LoginDm data) => json.encode(data.toJson());

class LoginDm {
  LoginDm({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  factory LoginDm.fromJson(Map<String, dynamic> json) => LoginDm(
    token: json["token"] == null ? null : json["token"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userNicename: json["user_nicename"] == null ? null : json["user_nicename"],
    userDisplayName: json["user_display_name"] == null ? null : json["user_display_name"],
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
    "user_email": userEmail == null ? null : userEmail,
    "user_nicename": userNicename == null ? null : userNicename,
    "user_display_name": userDisplayName == null ? null : userDisplayName,
  };
}
