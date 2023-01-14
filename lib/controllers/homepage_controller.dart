import 'dart:convert';

import 'package:cmmtbook/controllers/CRUD_controller.dart';
import 'package:cmmtbook/models/barcode_model.dart';
import 'package:cmmtbook/models/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:cmmtbook/settings/config.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {

  final CrudController crudController = Get.find();

  String strConstBarcodePath="/api/barcodes/";
  String strConstCommentPath="/api/comments/";


  var strScannerBarcode = "".obs;
  RxBool blnTestMode = true.obs;
  RxInt intBarcodeID = 0.obs;
  RxList<Datum> lstDataOfComments = <Datum>[].obs;


  Future<void> GetBarcode(String strReceivedBarcodeKey) async {

    if (blnTestMode.value) {
      strReceivedBarcodeKey = "9786059533058";
    }
    try {
     var response= await crudController.httpGetByFromUri("${strConstBarcodePath}getbarcode","strBarcodeKey",strReceivedBarcodeKey);
      if (response.statusCode == 200) {
        var result = barcodeModelFromJson(response.body);
        intBarcodeID = result.data!.id!.toInt().obs;
        print(intBarcodeID.toString());
      } else {
        print("Bu barcodeKey'e ait bir kayit bulunamadi.");
      }
    } catch (e) {
      print("Alinan Hata=${e.toString()}");
    }
  }

  Future<void> GetComments(int intReceivedBarcodeRID) async {

    try {
      lstDataOfComments.clear();
      var response= await crudController.httpGetByFromUri("${strConstCommentPath}getcomment","intBarcodeRID",intReceivedBarcodeRID);

      if (response.statusCode == 200) {
        var result = commentModelFromJson(response.body);
        for (var dataOfComment in result.data!) {
          lstDataOfComments.add(dataOfComment);
        }
        print(lstDataOfComments.toString());
      } else {
        print("Yorumlar getirilirken bir hata oluştu.");
        print(response.body.toString());
      }
    } catch (e) {
      print("Alinan Hata=${e.toString()}");
    }
  }
}
