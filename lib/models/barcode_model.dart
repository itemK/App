// To parse this JSON data, do
//
//     final barcodeModel = barcodeModelFromJson(jsonString);

import 'dart:convert';

BarcodeModel barcodeModelFromJson(String str) => BarcodeModel.fromJson(json.decode(str));

String barcodeModelToJson(BarcodeModel data) => json.encode(data.toJson());

class BarcodeModel {
    BarcodeModel({
        this.data,
        this.success,
        this.message,
    });

    Data? data;
    bool? success;
    dynamic message;

    factory BarcodeModel.fromJson(Map<String, dynamic> json) => BarcodeModel(
        data: Data.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "success": success,
        "message": message,
    };
}

class Data {
    Data({
        this.id,
        this.barcodeKey,
    });

    int? id;
    String? barcodeKey;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        barcodeKey: json["barcodeKey"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "barcodeKey": barcodeKey,
    };
}
