import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/pojjo/customeButton.dart';
import 'package:practice/views/purchase/all_purchases.dart';
import 'package:practice/views/purchase/purchase_on_credit.dart';
import 'package:provider/provider.dart';
import '../pojjo/colors.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({Key? key}) : super(key: key);

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}
class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, data, child) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            height: Get.height,
            color: CustomeColors.basicYellow,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomeButton('All Purchases', (){
                 goto(AllPurchasesDetail());
                  }),
                  CustomeButton('Purchase On Credit', (){
                  goto(PurchaseOnCredit());
                  }),
                  CustomeButton('All Purchases',(){

                  }),
                  CustomeButton('All Purchases',(){

                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
