import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogUtil {

  static void closeDialog() async {
    Get.back();
  }

  static Future<void> loadingDialog() async {
    Get.dialog(
      PopScope(
        canPop: false, // supaya back button tidak bisa nutup
        child: AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: const Text("Mohon tunggu..."),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false, // supaya tidak bisa ditutup klik luar
    );
  }

  static Future<void> show(String textDialog) async {
    return Get.dialog(
      PopScope(
        canPop: true, // supaya back button tidak bisa nutup
        child: AlertDialog(
          content: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text("$textDialog"),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                closeDialog();
              },
              child: Text("Tutup"),
            ),
          ],
        ),
      ),
      barrierDismissible: false, // supaya tidak bisa ditutup klik luar
    );
  }
}