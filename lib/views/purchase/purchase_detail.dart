import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/pojjo/customeButton.dart';
import 'package:practice/views/purchase/add_new_purchases.dart';
import 'package:practice/views/purchase/all_purchases.dart';
import 'package:practice/views/purchase/purchase_payment.dart';
import '../../services/jsonResponsesModel/purchase_response/get_purchase_response.dart';
import '../pojjo/colors.dart';

class PurchaseDetails extends StatefulWidget {
  PurchaserDetail purchaseData;

  PurchaseDetails(this.purchaseData);

  @override
  State<PurchaseDetails> createState() => _PurchaseDetailsState();
}

class _PurchaseDetailsState extends State<PurchaseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomeColors.basicTextColorGreen,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: CustomeColors.basicWhite,
            )),
        title: Text(
          widget.purchaseData.companyName,
          style: TextStyle(
              color: CustomeColors.basicWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold),
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
                    decoration: const BoxDecoration(
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
                  CustomeButton("Pay Now", () {
                    goto(PurchasePayment(widget.purchaseData.id.toString(),widget.purchaseData.remainingAmount.toString()));

                  }),

                      CustomeButton( "Edit Purchase", () {  goto(AddNewPurchase(
                          purchaseData: widget.purchaseData));}),
                      CustomeButton( "Delete Purchase", () {  var id = widget.purchaseData.id;
                      String body = "?id=$id";
                      ApiService.deletePurchase(body);
                      goto(AllPurchasesDetail(), isPrevClose: true); }),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
