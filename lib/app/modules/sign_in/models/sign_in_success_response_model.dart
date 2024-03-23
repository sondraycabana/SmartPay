import 'dart:convert';

SignInSuccessResponseModel signInSuccessResponseModelFromJson(String str) => SignInSuccessResponseModel.fromJson(json.decode(str));

String signInSuccessResponseModelToJson(SignInSuccessResponseModel data) => json.encode(data.toJson());

class SignInSuccessResponseModel {
  SignInSuccessResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  final bool status;
  final String message;
  final Data data;
  final List<dynamic> meta;
  final List<dynamic> pagination;

  factory SignInSuccessResponseModel.fromJson(Map<String, dynamic> json) => SignInSuccessResponseModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    pagination: List<dynamic>.from(json["pagination"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "pagination": List<dynamic>.from(pagination.map((x) => x)),
  };
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    this.phone,
    this.phoneCountry,
    required this.country,
    this.avatar,
  });

  final String id;
  final String fullName;
  final String username;
  final String email;
  final dynamic phone;
  final dynamic phoneCountry;
  final String country;
  final dynamic avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["full_name"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    phoneCountry: json["phone_country"],
    country: json["country"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "username": username,
    "email": email,
    "phone": phone,
    "phone_country": phoneCountry,
    "country": country,
    "avatar": avatar,
  };
}
