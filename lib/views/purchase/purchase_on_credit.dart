import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/utls/user_shared_preferences.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/pojjo/colors.dart';
import 'package:practice/views/purchase/purchase_on_credit_details.dart';
import 'package:provider/provider.dart';

import '../pojjo/appBar.dart';

class PurchaseOnCredit extends StatefulWidget {
  const PurchaseOnCredit({Key? key}) : super(key: key);

  @override
  State<PurchaseOnCredit> createState() => _PurchaseOnCreditState();
}

class _PurchaseOnCreditState extends State<PurchaseOnCredit> {
  // int? index;
  List<dynamic> userlist=[];

  @override
  initState(){
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return
      Consumer<UserProvider>(builder: (builder,data,child)
      {

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: CustomeAppBar(() {
              // Navigator.of(context).pop();
              Get.back();
            },title: "All Purchases On Credit",
            ),
          ),
          body: SafeArea(

            child: Container(
              height: Get.height,
              color: CustomeColors.basicYellow,
              child: SingleChildScrollView(

                child:
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top:25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Company",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Total Q",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Amount",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 14),),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Due",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Container(
                                alignment: Alignment.centerRight
                                ,
                                child: Text('More',style: TextStyle(  color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                          ),
                        ),
                      ],

                    ),
                  ),
                  data.isPurchaseOnCreditLoaded
                      ?
                  ListView.builder(

                      physics: NeverScrollableScrollPhysics(),
                      itemCount: !data.isPurchaseOnCreditLoaded ? 0: data.getPurchaseOnCreditResponse!.purchaseOnCreditDetails.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index)

                      {
                        var purchaseOnCreditData=data.getPurchaseOnCreditResponse!.purchaseOnCreditDetails[index];
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: 80,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: CustomeColors.basicTextColorGreen)),


                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("${purchaseOnCreditData.companyName}",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 13),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("${purchaseOnCreditData.totalQuantity}",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 13),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("${purchaseOnCreditData.remainingQuantity}",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 13),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("${purchaseOnCreditData.creationDate.toString().split(' ')[0]}",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 13),),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){

                                      goto(PurchaseOnCreditDetails(purchaseOnCreditData));

                                    },

                                    child: Padding(
                                      padding: const EdgeInsets.only(right:8.0),
                                      child: Container(
                                          alignment: Alignment.centerRight
                                          ,
                                          child: Text('More',style: TextStyle(  color: CustomeColors.basicRed, fontWeight: FontWeight.bold, fontSize: 13),)),
                                    ),
                                  ),
                                ),
                              ],

                            ),
                          ),
                        );
                      }
                  )
                      :
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],),


              ),
            ),
          ),


        );
      });

  }

  void getData(){
    userlist = UserSharedPreferences.getLoginDetail();
    var user_idfk=userlist[1];
    logger.i(user_idfk);
    String body= "?user_idfk=$user_idfk";
    ApiService.getPurchasesOnCredit(body);
  }


}
