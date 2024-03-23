import 'dart:convert';

SignUpSuccessResponseModel signUpSuccessResponseModelFromJson(String str) =>
    SignUpSuccessResponseModel.fromJson(json.decode(str));

String signUpSuccessResponseModelToJson(SignUpSuccessResponseModel data) =>
    json.encode(data.toJson());

class SignUpSuccessResponseModel {
  SignUpSuccessResponseModel({
    this.status,
    this.message,
    this.data,
    this.meta,
    this.pagination,
  });

  final bool? status;
  final String? message;
  final Data? data;
  final List<dynamic>? meta;
  final List<dynamic>? pagination;

  factory SignUpSuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpSuccessResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        meta: json["meta"] == null
            ? []
            : List<dynamic>.from(json["meta"]!.map((x) => x)),
        pagination: json["pagination"] == null
            ? []
            : List<dynamic>.from(json["pagination"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "pagination": pagination == null
            ? []
            : List<dynamic>.from(pagination!.map((x) => x)),
      };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  final User? user;
  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.fullName,
    this.username,
    this.email,
    this.country,
    this.id,
  });

  final String? fullName;
  final String? username;
  final String? email;
  final String? country;
  final String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        country: json["country"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "email": email,
        "country": country,
        "id": id,
      };
}
