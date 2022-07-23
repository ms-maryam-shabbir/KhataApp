import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/utls/user_shared_preferences.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/pojjo/colors.dart';
import 'package:practice/views/purchase/purchase_detail.dart';
import 'package:provider/provider.dart';
import '../pojjo/appBar.dart';
class AllPurchasesDetail extends StatefulWidget {
  const AllPurchasesDetail({Key? key}) : super(key: key);

  @override
  State<AllPurchasesDetail> createState() => _AllPurchasesDetailState();
}

class _AllPurchasesDetailState extends State<AllPurchasesDetail> {
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

Get.back();
            },title: "All Purchases",
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
                            child: Text("Total",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Left",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 14),),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Date",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),),
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
                  data.isPurchaseDataLoaded
                      ?
                  ListView.builder(

                      physics: NeverScrollableScrollPhysics(),
                      itemCount: !data.isPurchaseDataLoaded ? 0: data.getPurchaseResponse!.purchaserDetails.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index)

                      {
                        var purchaseData=data.getPurchaseResponse!.purchaserDetails[index];
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
                                    child: Text("${purchaseData.companyName}",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 13),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("${purchaseData.totalQuantity}",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 13),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("${purchaseData.remainingQuantity}",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 13),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("${purchaseData.creationDate.toString().split(' ')[0]}",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 13),),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){

                                      goto(PurchaseDetails(purchaseData));

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
    ApiService.getPurchaseDetails(body);
  }


}
