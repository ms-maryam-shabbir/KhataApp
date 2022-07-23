import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/services/jsonResponsesModel/sales_response_model/get_sales_response.dart';
import 'package:practice/utls/user_shared_preferences.dart';
import 'package:practice/utls/utls.dart';

import 'package:practice/views/pojjo/colors.dart';

import 'package:practice/views/purchase/purchase_detail.dart';
import 'package:practice/views/sales/sales_detail.dart';
import 'package:provider/provider.dart';
import '../../controllers/map_provider/map_provider.dart';


class AllSalesDetails extends StatefulWidget {
  const AllSalesDetails({Key? key}) : super(key: key);

  @override
  State<AllSalesDetails> createState() => _AllSalesDetailsState();
}

class _AllSalesDetailsState extends State<AllSalesDetails> {
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
                            child: Text("Customer",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Quantity",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Paid",style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 14),),
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
                  data.isSalesDataLoaded
                      ?
                  ListView.builder(

                      physics: NeverScrollableScrollPhysics(),
                      itemCount: !data.isSalesDataLoaded ? 0: data.getSalesResponse!.salesDetails.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index)

                      {
                        var salesData=data.getSalesResponse!.salesDetails[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: CustomeColors.basicTextColorGreen)),


                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text(salesData.quantity,style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
                                ),
                                InkWell(
                                  onTap: (){
                                    logger.i(salesData.toJson());
                                    goto(SalesDetails(salesData));

                                  },

                                  child: Padding(
                                    padding: const EdgeInsets.only(right:8.0),
                                    child: Text('More',style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
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

    String body= "?user_idfk=$user_idfk";
    ApiService.getSalesDetails(body);
  }


}
