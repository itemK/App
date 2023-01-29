import 'dart:convert' show json;
import 'package:cmmtbook/consts/message.dart';
import 'package:cmmtbook/controllers/CRUD_controller.dart';
import 'package:cmmtbook/models/barcode_model.dart';
import 'package:cmmtbook/models/token_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../settings/config.dart';

class LoginController extends GetxController {
  final CrudController crudController = Get.find();

  final _url = Uri.http('${Config.url}', '/api/auth/login');

  Rx<String?> strAccessToken = "".obs;
  Rx<DateTime?> dtExpirationDate = DateTime.now().obs;

  String strLoginPath = "/api/auth/login";
  String strRegisterPath = "/api/auth/register";

  var intUserID = "".obs;
  var isLoadedOtherPage = false.obs;
  var blnIsRegister = false.obs;
  var strLoginOrSignUpButtonText = "SIGNUP".obs;
  var strMessage = "".obs;
  var blnIsPassedCheck = true;
  List<bool> lstCheckBusinessRule = [];

  Future doLogin(String? email, String? password) async {
    try {
      print("doLogin İşelim");

      addLstCheckBusinessRule(mailAndPasswordNullControl(email, password));
      var responseBusinessRule = BusinessRules.Run(lstCheckBusinessRule);

      if (responseBusinessRule) {
        _setBody() => {'Email': email, 'Password': password};
        _setHeader() => {"Content-Type": "application/json"};

        var response = await crudController.httpPostByFromBody(
            strLoginPath, _setHeader(), _setBody());

        print(response.statusCode.toString());
        print(response.body.toString());

        if (response.statusCode == 200) {
          print(response.statusCode.toString());

          var result = tokenModelFromJson(response.body);
          strAccessToken = result.token.obs;
          dtExpirationDate = result.expiration.obs;
          return result;
        } else {
          print(response.statusCode);
        }
      }

      // if (email != null && password != null) {
      //   _setBody() => {'Email': email, 'Password': password};
      //   _setHeader() => {"Content-Type": "application/json"};

      //   final response = await http.post(_url,
      //       headers: _setHeader(), body: json.encode(_setBody()));

      //   print(response.statusCode.toString());
      //   print(response.body.toString());

      //   if (response.statusCode == 200) {
      //     print(response.statusCode.toString());

      //     var result = tokenModelFromJson(response.body);
      //     strAccessToken = result.token.obs;
      //     dtExpirationDate = result.expiration.obs;
      //     // isLoadedOtherPage.toggle();
      //     return result;
      //   } else {
      //     print(response.statusCode);
      //   }
      // } else {
      //   return null;
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  Future doRegister(String? email, String? password, String? passwordConfirm,String? firstName, String? lastName) async {
    try {
      print("doRegister İşelim");

     // addLstCheckBusinessRule(mailAndPasswordNullControl(email, password));
      var responseBusinessRule = BusinessRules.Run(lstCheckBusinessRule);

      if (responseBusinessRule) {

      _setBody() => {
            'Email': email,
            'Password': password,
            'FirstName': firstName,
            'LastName': lastName
          };
      _setHeader() => {"Content-Type": "application/json"};

      var response = await crudController.httpPostByFromBody(
          strRegisterPath, _setHeader(), _setBody());

      if (response.statusCode == 200) {
        print(response.statusCode.toString());

        var result = tokenModelFromJson(response.body);
        strAccessToken = result.token.obs;
        dtExpirationDate = result.expiration.obs;
        // isLoadedOtherPage.toggle();
        return result;
      }
      // if (email != null && password != null) {
      //   final response = await http.post(_url,
      //       headers: _setHeader(), body: json.encode(_setBody()));

      //   print(response.statusCode.toString());
      //   print(response.body.toString());

      //   if (response.statusCode == 200) {
      //     print(response.statusCode.toString());

      //     var result = tokenModelFromJson(response.body);
      //     strAccessToken = result.token.obs;
      //     dtExpirationDate = result.expiration.obs;
      //     // isLoadedOtherPage.toggle();
      //     return result;
      //   } else {
      //     print(response.statusCode);
      //   }
      // } else {
      //   return null;
      // }        
      }

    } catch (e) {
      print(e.toString());
    }
  }

  // checkMatchPassword() {
  //   var _blnIsMatch = true;
  //   if (strPassword != strPasswordConfirm) {
  //     _blnIsMatch = false;
  //     strMessage.value = Messages.doesNotMatchPassword;
  //   }
  //   return _blnIsMatch;
  // }

  // showMessageOnScreen(String? message){
  //   strMessage.value=message!;
  // }

  bool mailAndPasswordNullControl(String? email, String? password) {
    if (email!.isEmpty || password!.isEmpty) {
      blnIsPassedCheck = false;
      // lstCheckBusinessRule.add(blnIsPassedCheck);
      strMessage.value = Messages.usernameOrPasswordNull;
    }
    return blnIsPassedCheck;
  }

  addLstCheckBusinessRule(bool willAddBusinessRule) {
    lstCheckBusinessRule.add(willAddBusinessRule);
  }
}

class BusinessRules {
  static Run(List<bool> logics) {
    for (var i = 0; i < logics.length; i++) {
      if (logics[i] == false) {
        return logics[i];
      }
    }
  }
}
