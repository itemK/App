import 'dart:io';

import 'package:cmmtbook/controllers/localization_controller.dart';
import 'package:cmmtbook/controllers/mainbinding.dart';
import 'package:cmmtbook/screens/comment_screen.dart';
import 'package:cmmtbook/screens/homepage_screen.dart';
import 'package:cmmtbook/screens/loginpage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      initialRoute: "/",
      initialBinding: MainBinding(),
      getPages: [
        GetPage(name: "/", page: ()=>LoginPage()) //LoginPage' olacak
      ],
      theme: ThemeData(
        // primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      title: 'xBook',
    );
  }
  
}

//   class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }