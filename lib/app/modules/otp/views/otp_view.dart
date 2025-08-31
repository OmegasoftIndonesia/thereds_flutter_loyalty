import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:thereds_flutter_loyalty/app/modules/home/views/home_view.dart';

import '../../../data/Constants.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("${Constants.imageAsset}logo.png",width: 250,height: 200,),
                  Text("Input the 6 digit OTP you got on Whatsapp", style: TextStyle(color: Colors.white),),
                  SizedBox(height: 60),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(Constants.BGInput),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Pinput(
                        length: 6,
                        keyboardType: TextInputType.number,
                        controller: controller.otp,
                        defaultPinTheme: PinTheme(
                          width: 56,
                          height: 56,
                          textStyle: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.white
                            )),
                          ),
                        ),
                      ),
                    )
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
                       controller.validateOTP();
                      },
                      child: Text(
                        "Submit",
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
        ),
      ),
    );
  }
}
