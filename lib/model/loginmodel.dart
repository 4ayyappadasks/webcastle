// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromJson(String str) => Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  int errorCode;
  String message;
  Data data;

  Loginmodel({
    required this.errorCode,
    required this.message,
    required this.data,
  });

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
    errorCode: json["error_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error_code": errorCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String accessToken;

  Data({
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
  };
}
