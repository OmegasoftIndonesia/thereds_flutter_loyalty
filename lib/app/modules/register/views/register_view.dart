import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/modules/login/views/login_view.dart';

import '../../../data/Constants.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
                        Text(
                          "Let's Get Started!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Create an account to get all features",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(height: 60),
                        Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(Constants.BGInput),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 60,
                                child: TextFormField(
                                  controller: controller.name,
                                  style: TextStyle(color: Colors.white),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hint: Text("Full Name",
                                      style: TextStyle(color: Colors.white),),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(Constants.mainColor),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length <= 0) {
                                      return "Full Name can't be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(Constants.BGInput),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 60,
                                child: TextFormField(
                                  controller: controller.hp,
                                  style: TextStyle(color: Colors.white),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                  ],
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hint: Text("Phone Number",
                                      style: TextStyle(color: Colors.white),),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Color(Constants.mainColor),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length <= 0) {
                                      return "Phone Number can't be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(Constants.BGInput),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 60,
                                child: TextFormField(
                                  controller: controller.email,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hint: Text("E-Mail",
                                      style: TextStyle(color: Colors.white),),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color(Constants.mainColor),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.length <= 0) {
                                      return "E-Mail can't be empty";
                                    } else if(!value.contains("@")){
                                      return "E-Mail format not valid";
                                    }else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(Constants.BGInput),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 60,
                                child: Obx(() {
                                  return TextFormField(
                                    readOnly: true,
                                    onTap: (){
                                      BottomPicker.date(
                                        headerBuilder: (context) {
                                          return Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(12),
                                            child: const Text(
                                              'Your Birth Date',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          );
                                        },
                                        onSubmit: (date) {
                                          controller.setDate(date);
                                        },
                                        minDateTime: DateTime(1900, 1, 1),
                                        maxDateTime: DateTime(2100, 12, 31),
                                      ).show(context);
                                    },
                                    controller: controller.ttl,
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hint: Text("${DateFormat("yyyy-MM-dd").format(controller.selectedDate.value)}",
                                        style: TextStyle(color: Colors.white),),
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Color(Constants.mainColor),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(Constants.BGInput),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 60,
                                child: TextFormField(
                                  controller: controller.kota,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hint: Text(
                                      "City", style: TextStyle(color: Colors.white),),
                                    prefixIcon: Icon(
                                      Icons.pin_drop_outlined,
                                      color: Color(Constants.mainColor),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(Constants.mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              controller.registerUser();
                            },
                            child: Text(
                              "Create",
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
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Login",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.off(() => LoginView());
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
