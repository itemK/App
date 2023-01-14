import 'package:cmmtbook/controllers/localization_controller.dart';
import 'package:cmmtbook/controllers/login_controller.dart';
import 'package:cmmtbook/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? _strEmail;
  String? _strPassword;
  String _selectedLang = LocalizationService.langs.first;

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    var scaleOfScreen = MediaQuery.of(context).size;

    return Scaffold(
        // appBar: AppBar(
        //     // leading: const Icon(Icons.snooze_outlined),
        //     elevation: 15,
        //     shadowColor: Colors.red.shade600,
        //     // backgroundColor: Colors.cyan,
        //     foregroundColor: Colors.deepOrange.shade400,
        //     // primary: false,
        //     toolbarHeight: 30,
        //     title: const Text("LOG-IN")),
        body: Container(
      color: Colors.green.shade300,
      width: scaleOfScreen.width,
      height: scaleOfScreen.height,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //LOGO CONTAİNER
            // Expanded(
            //   child: Container(
            //     // color: Colors.white,
            //     height: scaleOfScreen.height * 0.20,
            //     width: scaleOfScreen.width * 0.60,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage('assets/images/booklogo.png')),
            //     ),
            //   ),
            // ),
            //BAŞLIK TEXT
            Container(
              child: Text(
                "xBook",
                style: TextStyle(fontSize: 60, color: Colors.brown),
              ),
            ),
      
            //GİRİŞ BİLGİLERİ CONTAİNER'I
            Container(
              // color: Colors.white,
              width: scaleOfScreen.width * 0.80,
              height: controller.blnIsRegister.value==false ? scaleOfScreen.height * 0.45 : scaleOfScreen.height * 0.65,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //EMAİL TEXTFORMFİELD
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_rounded),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onSaved: (emailNewValue) {
                          _strEmail = emailNewValue;
                        },
                      ),
                    ),
                    //PASSWORD TEXTFORMFİELD
                    Container(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: Icon(Icons.remove_red_eye_rounded),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onSaved: (passwordNewValue) {
                          _strPassword = passwordNewValue;
                        },
                      ),
                    ),
                    if(controller.blnIsRegister.value) ...[
                   //FİRSTNAME TEXTFORMFİELD
                    Container(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Firstname",
                          prefixIcon: Icon(Icons.article_rounded),
                        //  suffixIcon: Icon(Icons.remove_red_eye_rounded),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onSaved: (passwordNewValue) {
                          _strPassword = passwordNewValue;
                        },
                      ),
                    ),
                    //LASTNAME TEXTFORMFIELD                   
                    Container(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "LastName",
                          prefixIcon: Icon(Icons.article_rounded),
                         // suffixIcon: Icon(Icons.remove_red_eye_rounded),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onSaved: (passwordNewValue) {
                          _strPassword = passwordNewValue;
                        },
                      ),
                    ),
                    ],
                    //Şifremi Unuttum Yazısı
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // LOGIN BUTONU
                    SizedBox(
                      width: scaleOfScreen.width * 0.30,
                      child: ElevatedButton(
                          onPressed: () async {
                            _formKey.currentState!.save();
                           await controller
                                .doLogin(_strEmail, _strPassword)
                                .then((value) => {
                                      if (value != null)
                                        {
                                          _formKey.currentState!.reset(),
                                          Get.to(HomePage())
                                        }
                                      else
                                        {
                                          Get.snackbar(
                                            "strSnackBarErrorMessageTitle".tr,
                                            "strSnacBarErrorMessage".tr,
                                            backgroundColor: Colors.teal,
                                            icon: Icon(Icons.warning,
                                                color: Colors.red),
                                            snackPosition: SnackPosition.BOTTOM,
                                          )
                                        }
                                    });
                          },
                          child: Text(controller.blnIsRegister.value==true?"SIGNUP":"LOGIN")),
                    ),
                    //SIGNUP BUTONU
                    TextButton(onPressed: () {
                      print("1"+controller.strLoginOrSignUpButtonText.value.toString());
                      print("1"+controller.blnIsRegister.value.toString());
                      if(controller.blnIsRegister.value==true){
                        controller.blnIsRegister.value=false;
                        controller.strLoginOrSignUpButtonText.value="SIGNUP";
                      }else {
                        controller.blnIsRegister.value=true;
                        controller.strLoginOrSignUpButtonText.value="LOGIN";
                      }
                     // controller.blnIsRegister.value==true ? false:true;
                      print(controller.strLoginOrSignUpButtonText.toString());
                      print(controller.blnIsRegister.toString());
                    }, child: Text(controller.strLoginOrSignUpButtonText.value))
                  ],
                ),
              ),
            ),
            //LOGO ve GİRİŞ Bilgilerinin düzeni için boş container
            Expanded(
              child: Container(
                // color: Colors.white,
                width: scaleOfScreen.width,
                height: scaleOfScreen.height * 0.10,
              ),
            )
          ],
        ),
      ),
    ));
  }
}

/*

 SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.teal.shade100,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 // mainAxisAlignment: MainAxisAlignment.center, // Ekrandaki verileri ortaladık(ekrana göre)
                  children: [
                    SizedBox(height: 25,),
                    TextFormField(
                    //  initialValue: "age",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                          ),
                        ),
                        labelText: "strUserNameText".tr,
                        hintText: "strUserNameText".tr,
                      ),
                      onSaved: (value) {
                        _strUserName = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                     // initialValue: "",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                          ),
                        ),
                        labelText: "strPasswordText".tr,
                        hintText: "strPasswordText".tr,
                      ),
                      onSaved: (value) {
                        _strPassword = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputDecorator(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          contentPadding: EdgeInsets.all(5)),
                      child: DropdownButtonHideUnderline(
                        child:DropdownButton<String>(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                            items: LocalizationService.langs.map((String lang) {
                              return DropdownMenuItem(child: Text(lang) ,value: lang);
                            }).toList(),
                            value: _selectedLang,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLang=newValue!;
                                LocalizationService().changeLocale(newValue);
                              });
                              
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       ElevatedButton.icon(
                            onPressed: () async {
                              _formKey.currentState!.save();
                              await controller
                                  .doLogin(_strUserName, _strPassword)
                                  .then((value) => {
                                        if (value != null)
                                          {
                                            _formKey.currentState!.reset(),
                                           Get.to(HomePage()) 
                                          }
                                        else
                                          {
                                            Get.snackbar(
                                              "strSnackBarErrorMessageTitle".tr,
                                              "strSnacBarErrorMessage".tr,
                                              backgroundColor: Colors.teal,
                                              icon: Icon(Icons.warning,
                                                  color: Colors.red),
                                              snackPosition: SnackPosition.BOTTOM,
                                            ),
                                          }
                                      });
                            },
                            icon: const Icon(Icons.lock_open),
                            label: Text("strLoginButtonText".tr)), 
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel_outlined),
                            label: Text("strCloseButtonText".tr)), 
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

 */