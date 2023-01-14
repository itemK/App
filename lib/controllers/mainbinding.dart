

import 'package:cmmtbook/controllers/CRUD_controller.dart';
import 'package:cmmtbook/controllers/homepage_controller.dart';
import 'package:cmmtbook/controllers/login_controller.dart';
import 'package:get/get.dart';
class MainBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(LoginController());
   Get.lazyPut(() =>HomepageController(),fenix: true);
   Get.lazyPut(() => CrudController(),fenix: true);
  //  Get.lazyPut(() => SearchTransactionController(),fenix: true);
  //  Get.lazyPut(() => BarcodeDetailsPageController(),fenix: true);
  }

}