// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
    CommentModel({
        this.data,
        this.success,
        this.message,
    });

    List<Datum>? data;
    bool? success;
    dynamic message;

    factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}

class Datum {
    Datum({
        this.id,
        this.userRid,
        this.barcodeRid,
        this.explanation,
        this.isActive,
    });

    int? id;
    int? userRid;
    int? barcodeRid;
    String? explanation;
    bool? isActive;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userRid: json["userRID"],
        barcodeRid: json["barcodeRID"],
        explanation: json["explanation"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userRID": userRid,
        "barcodeRID": barcodeRid,
        "explanation": explanation,
        "isActive": isActive,
    };
}
