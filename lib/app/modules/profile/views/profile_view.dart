import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thereds_flutter_loyalty/app/util/injector.dart';
import 'package:thereds_flutter_loyalty/app/util/shared_prefs.dart';

import '../../../data/Constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.HOME);
          },
          icon: Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Obx(() {
                      return CircleAvatar(
                        radius: 50,
                        backgroundImage: (controller.fotoKtpIsChanged.value)
                            ? FileImage(File(controller.pickedFilePath.value))
                            : NetworkImage(
                          Constants.internetImage +
                              controller.util.getString(
                                PreferencesUtil.fotoProfil,
                              )!,
                        ),
                      );
                    }),
                    Positioned(
                      top: 70,
                      left: 70,
                      child: InkWell(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(Constants.mainColor),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit_outlined, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${controller.util.getString(PreferencesUtil.name)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "No HP",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hint: Text(
                              "${controller.util.getString(
                                  PreferencesUtil.phone)}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "E-mail",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hint: Text(
                              "${controller.util.getString(
                                  PreferencesUtil.email)}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Kota",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(() {
                        return SizedBox(
                          child: TextFormField(
                            controller: controller.kota,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Kota can't be empty";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hint: Text(
                                controller.kotaVal.value,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Tanggal Lahir",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(() {
                        return SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
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
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: controller.dayVal.value,
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
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
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: controller.monthVal.value,
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
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
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: controller.yearVal.value,
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(Constants.mainColor),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        controller.updateCustProfile();
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    color: Color(Constants.mainColor),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {
                     controller.SignOut();
                    },
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
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
