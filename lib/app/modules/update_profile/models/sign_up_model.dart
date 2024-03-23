import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.fullName,
    this.username,
    this.email,
    this.country,
    this.password,
    this.deviceName,
  });

  final String? fullName;
  final String? username;
  final String? email;
  final String? country;
  final String? password;
  final String? deviceName;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    fullName: json["full_name"],
    username: json["username"],
    email: json["email"],
    country: json["country"],
    password: json["password"],
    deviceName: json["device_name"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "username": username,
    "email": email,
    "country": country,
    "password": password,
    "device_name": deviceName,
  };
}
