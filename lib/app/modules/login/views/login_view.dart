import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/util/dialog_util.dart';
import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("${Constants.imageAsset}logo.png",width: 250,height: 200,),
                        Text(
                          "Hello!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sign into your account",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(height: 60),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(Constants.BGInput),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: TextField(
                            controller: controller.hp,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              color: Colors.white
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color(Constants.mainColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(Constants.mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              if(controller.hp.text.isEmpty ||controller.hp.text == "" ){
                                DialogUtil.show("No Hp anda kosong");
                              }else{
                                controller.cekLogin();
                              }

                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Sign Up",
                        recognizer: TapGestureRecognizer()..onTap = () {
                         Get.toNamed(Routes.REGISTER);
                        },
                        style: TextStyle(
                          color: Color(Constants.mainColor),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
