import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/services/jsonResponsesModel/sales_response_model/get_sales_response.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/purchase/all_purchases.dart';
import 'package:practice/views/sales/add_new_sales.dart';
import '../pojjo/colors.dart';

class SalesDetails extends StatefulWidget {
  SalesDetail salesData;

  SalesDetails(this.salesData);
  @override
  State<SalesDetails> createState() => _SalesDetailsState();
}

class _SalesDetailsState extends State<SalesDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomeColors.basicTextColorGreen,
        centerTitle: true,
        leading: InkWell(
            onTap: (){

              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios_rounded, color: CustomeColors.basicWhite,)),
        title: Text(widget.salesData.custName, style: TextStyle(color: CustomeColors.basicWhite,fontSize: 20, fontWeight: FontWeight.bold ),),



      ),
      body:SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 300,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image:  DecorationImage(
                        image: AssetImage('assets/pakistan.png'),
                        fit: BoxFit.fill,
                      ),
                    ),



                  ),
                  Divider(),

                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex:1, child: Text("Quantity", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(flex:2, child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(widget.salesData.quantity, style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex:1,
                            child: Text("PricePerKg", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(
                            flex:2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(widget.salesData.pricePerKg, style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex:1,
                            child: Text("Total", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(
                            flex:2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(widget.salesData.total, style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex:1,
                            child: Text("Status", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(
                            flex:2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(widget.salesData.status, style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0,bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex:1,
                            child: Text("Due Date", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(
                            flex:2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(widget.salesData.creationDate.toString().split(' ')[0], style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width/2.5,
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
                              shape:  RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () async {
                              goto(AddNewSales(salesData: widget.salesData));

                            },
                            child: Text(
                              "Edit Sales",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomeColors.basicbuttonTextColorWhite),
                            )),
                      ),
                      Container(
                        width: Get.width/2.5,
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
                              var id=widget.salesData.id;
                              String body="?id=$id";
                              ApiService.deletePurchase(body);
                              goto(AllPurchasesDetail(), isPrevClose: true);
                            },
                            child: Text(
                              "Delete Sales",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomeColors.basicbuttonTextColorWhite),
                            )),
                      ),



                    ],)



                ],
              ),
            ),
          ),




        ),
      ),


    );
  }
}
