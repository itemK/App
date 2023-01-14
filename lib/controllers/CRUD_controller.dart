


import 'package:cmmtbook/settings/config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CrudController extends GetxController{

  var _urlFromConfig=Config.url;

   Future<http.Response> httpGetByFromUri(String strPath,String strParamName,dynamic strParamValue) async{

    var url = Uri.http(_urlFromConfig, strPath,{strParamName: strParamValue.toString()});
     final response = await http.get(url);

     return response;

  }

}