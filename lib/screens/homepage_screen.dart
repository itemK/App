import 'package:cmmtbook/controllers/homepage_controller.dart';
import 'package:cmmtbook/screens/comment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomepageController controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    controller.strScannerBarcode.value = barcodeScanRes;

    //print("Controllerdaki str=${controller.strScannerBarcode.toString()}");
    // setState(() {
    //   _scanBarcode = barcodeScanRes;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Test Mode"),
                  Container(
                    height: 50,
                    //color: Colors.red,
                    // child: OpenOrCloseTestMode(),
                    child: Switch(value: controller.blnTestMode.value, onChanged: 
                    (bool testModeValue){
                      controller.blnTestMode.value=testModeValue;
                      print(controller.blnTestMode.toString());
                    }
                    ),
                  ),
                ],
              ),
              Container(
                child: Center(
                  child: Text('Scan result : ${controller.strScannerBarcode.value}\n',
                      style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         await scanBarcodeNormal().then((value) =>
         {
          if (controller.strScannerBarcode.value!="") {
            controller.GetBarcode(controller.strScannerBarcode.value).then((value) => 
            {
              controller.GetComments(controller.intBarcodeID.value).then((value) => {
              if(controller.blnTestMode.value){
                 Get.to(CommentPage()),
              }
              })// Yorumları getirttik.

            }) //Barcode bilgisini çektik  
          }
         }); //Barcode tarattık
          
         // controller.GetComments(controller.strScannerBarcode.value,controller.testMode.value); //Yorumları Getirdik
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }

}


//SetState Kullanımında Sadece Gerekli Yer Build Edilmesi için Oluşturuldu
/*

class OpenOrCloseTestMode extends StatefulWidget {
  // final bool testMode;
  OpenOrCloseTestMode({Key? key}) : super(key: key);

  @override
  State<OpenOrCloseTestMode> createState() => _OpenOrCloseTestModeState();
}

class _OpenOrCloseTestModeState extends State<OpenOrCloseTestMode> {
  final HomepageController controller = Get.find();
  bool light = false;

  @override
  Widget build(BuildContext context) {
    print("3");
    return Switch(
        value: controller.testMode.value,
        onChanged: (bool value) {
          setState(() {
            // light=value;
            controller.testMode = value.obs;
            print(controller.testMode.toString());
          });
        });
  }
}

*/