import 'dart:convert';

GetEmailTokenSuccessResponseModel getEmailTokenSuccessResponseModelFromJson(
        String str) =>
    GetEmailTokenSuccessResponseModel.fromJson(json.decode(str));

String getEmailTokenSuccessResponseModelToJson(
        GetEmailTokenSuccessResponseModel data) =>
    json.encode(data.toJson());

class GetEmailTokenSuccessResponseModel {
  GetEmailTokenSuccessResponseModel({
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

  factory GetEmailTokenSuccessResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetEmailTokenSuccessResponseModel(
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
    this.token,
  });

  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
