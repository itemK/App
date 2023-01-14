// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
    TokenModel({
        this.token,
        this.expiration,
    });

    String? token;
    DateTime? expiration;

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
        expiration: DateTime.parse(json["expiration"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expiration": expiration!.toIso8601String(),
    };
}
