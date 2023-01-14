import 'dart:convert';
import 'dart:io';

import 'package:cmmtbook/models/login_model.dart';
import 'package:cmmtbook/models/token_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../settings/config.dart';

class LoginController extends GetxController {
 // final _url = Uri.http('10.0.2.2:10000', '/api/auth/login');
    final _url = Uri.http('${Config.url}', '/api/auth/login');

  Rx<String?> strAccessToken = "".obs;
  Rx<DateTime?> dtExpirationDate = DateTime.now().obs;

  var intUserID = "".obs;
  var isLoadedOtherPage = false.obs;
  var blnIsRegister=false.obs;
  var strLoginOrSignUpButtonText="".obs;

  Future doLogin(String? email, String? password) async {
    try {
      print("doLogin İşelim");

      _setBody() => {'Email': email, 'Password': password};
      _setHeader() => {"Content-Type": "application/json"};


      if (email != null && password != null) {
        final response = await http.post(_url,
            headers: _setHeader(), 
            body: json.encode(_setBody()));

        print(response.statusCode.toString());
        print(response.body.toString());

        if (response.statusCode == 200) {
          print(response.statusCode.toString());

          var result = tokenModelFromJson(response.body);
          strAccessToken = result.token.obs;
          dtExpirationDate = result.expiration.obs;
          // isLoadedOtherPage.toggle();
          return result;
        } else {
          print(response.statusCode);
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
