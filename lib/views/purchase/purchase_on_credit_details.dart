import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/pojjo/customeButton.dart';
import 'package:practice/views/purchase/add_new_purchases.dart';
import 'package:practice/views/purchase/all_purchases.dart';
import 'package:practice/views/purchase/purchase_payment.dart';
import '../../services/jsonResponsesModel/purchase_response/purchase_on_credit_response.dart';
import '../pojjo/appBar.dart';
import '../pojjo/colors.dart';

class PurchaseOnCreditDetails extends StatefulWidget {
  PurchaseOnCreditDetail purchaseData;

  PurchaseOnCreditDetails(this.purchaseData);

  @override
  State<PurchaseOnCreditDetails> createState() => _PurchaseOnCreditDetailsState();
}

class _PurchaseOnCreditDetailsState extends State<PurchaseOnCreditDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomeAppBar(() {
          // Navigator.of(context).pop();
          Get.back();
        },title: "Purchases On Credit",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/pakistan.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Total Quantity",
                              style: TextStyle(
                                  color: CustomeColors.basicTextColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.purchaseData.totalQuantity,
                                  style: TextStyle(
                                      color: CustomeColors.basicTextColorGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Remaining Quantity",
                              style: TextStyle(
                                  color: CustomeColors.basicTextColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.purchaseData.remainingQuantity
                                      .toString()
                                      .split(' ')[0],
                                  style: TextStyle(
                                      color: CustomeColors.basicTextColorGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "PricePerKg",
                              style: TextStyle(
                                  color: CustomeColors.basicTextColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.purchaseData.pricePerKg,
                                  style: TextStyle(
                                      color: CustomeColors.basicTextColorGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Total Amount",
                              style: TextStyle(
                                  color: CustomeColors.basicTextColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.purchaseData.total,
                                  style: TextStyle(
                                      color: CustomeColors.basicTextColorGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Paid Amount",
                              style: TextStyle(
                                  color: CustomeColors.basicTextColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.purchaseData.paidAmount
                                      .toString()
                                      .split(' ')[0],
                                  style: TextStyle(
                                      color: CustomeColors.basicTextColorGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Remaining Amount",
                              style: TextStyle(
                                  color: CustomeColors.basicTextColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.purchaseData.remainingAmount
                                      .toString()
                                      .split(' ')[0],
                                  style: TextStyle(
                                      color: CustomeColors.basicTextColorGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  color: CustomeColors.basicTextColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.purchaseData.status == '0'
                                      ? 'Paid'
                                      : widget.purchaseData.status == '1'
                                      ? 'Half Paid'
                                      : 'Not Paid',
                                  style: TextStyle(
                                      color: CustomeColors.basicTextColorGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Creation Date",
                              style: TextStyle(
                                  color: CustomeColors.basicTextColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  widget.purchaseData.creationDate
                                      .toString()
                                      .split(' ')[0],
                                  style: TextStyle(
                                      color: CustomeColors.basicTextColorGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))),
                      ],
                    ),
                  ),
                  CustomeButton("Add Payment", () {

                    goto(PurchasePayment( widget.purchaseData.id,widget.purchaseData.remainingAmount));
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width / 2.5,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: CustomeColors.basicTextColorGreen,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomeColors.basictransparent,
                              shadowColor: CustomeColors.basictransparent,
                              onPrimary: CustomeColors.basictransparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () async {
                              goto(AddNewPurchase(
                                  purchaseOnCreditDetailData: widget.purchaseData));
                            },
                            child: Text(
                              "Edit Purchase",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                  CustomeColors.basicbuttonTextColorWhite),
                            )),
                      ),
                      Container(
                        width: Get.width / 2.5,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: CustomeColors.basicRed,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomeColors.basictransparent,
                              shadowColor: CustomeColors.basictransparent,
                              onPrimary: CustomeColors.basictransparent,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () async {
                              var id = widget.purchaseData.id;
                              String body = "?id=$id";
                              ApiService.deletePurchase(body);
                              goto(AllPurchasesDetail(), isPrevClose: true);
                            },
                            child: Text(
                              "Delete Purchase",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                  CustomeColors.basicbuttonTextColorWhite),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
