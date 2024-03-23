import 'dart:convert';

HomeSuccessResponseModel homeSuccessResponseModelFromJson(String str) =>
    HomeSuccessResponseModel.fromJson(json.decode(str));

String homeSuccessResponseModelToJson(HomeSuccessResponseModel data) =>
    json.encode(data.toJson());

class HomeSuccessResponseModel {
  HomeSuccessResponseModel({
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

  factory HomeSuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeSuccessResponseModel(
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
    required this.secret,
  });

  final String secret;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        secret: json["secret"],
      );

  Map<String, dynamic> toJson() => {
        "secret": secret,
      };
}
