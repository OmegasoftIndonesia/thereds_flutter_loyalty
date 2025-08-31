import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thereds_flutter_loyalty/app/data/Constants.dart';
import 'package:thereds_flutter_loyalty/app/modules/home/views/home_view.dart';

import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BGApp),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomeView());
          },
          icon: Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: const Text(
          'Transaction History',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(Constants.BGApp),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(Constants.BGInput),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(Constants.imageAsset+"topUp.png",
                          width: 35,height: 35,),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Top Up",
                                style: TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),),
                                Text("Saturday",style: TextStyle(
                                    color:Colors.white,
                                  fontSize: 12
                                )),
                                Text("June 9, 2025 - 06.00 PM",style: TextStyle(
                                    color:Colors.grey,
                                  fontSize: 12
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text("+1.000.000"
                          ,style: TextStyle(
                              color:Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ))
                    ],
                  ),
                ),
              ),
            );
          },),
        ),
      ),
    );
  }
}
