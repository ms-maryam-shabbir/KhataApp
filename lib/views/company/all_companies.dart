import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/services/jsonResponsesModel/get_all_company_details_response.dart';
import 'package:practice/utls/user_shared_preferences.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/pojjo/colors.dart';
import 'package:provider/provider.dart';

import '../../controllers/map_provider/map_provider.dart';
import 'CompanyDetail.dart';
import 'add_new_company.dart';

class AllCompaniesDetail extends StatefulWidget {
  const AllCompaniesDetail({Key? key}) : super(key: key);

  @override
  State<AllCompaniesDetail> createState() => _AllCompaniesDetailState();
}

class _AllCompaniesDetailState extends State<AllCompaniesDetail> {
  late int index;
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
        if(data.isCompanyDetailsResponseLoaded)
          {
index=data.getCompanyDetailsResponse!.companyDetails.length;

          }

        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: CustomeColors.basicTextColorGreen,
          //   centerTitle: true,
          //   leading: InkWell(
          //       onTap: (){
          //
          //         Navigator.of(context).pop();
          //       },
          //       child: Icon(Icons.arrow_back_ios_rounded, color: CustomeColors.basicWhite,)),
          //   title: Text('All Companies', style: TextStyle(color: CustomeColors.basicWhite,fontSize: 20, fontWeight: FontWeight.bold ),),
          //   actions: [
          //     InkWell(
          //       onTap: (){
          //         goto(AddNewCompany());
          //       },
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Icon(Icons.add),
          //       ),
          //     ),
          //   ],
          //
          //
          // ),
          body: SafeArea(

            child: Container(
              height: Get.height,
              color: CustomeColors.basicYellow,
              child: SingleChildScrollView(

                child:
                Column(children: [
                  // Container(
                  //   height: 100,
                  //   width: Get.width,
                  //   decoration: BoxDecoration(
                  //     border: Border(bottom: BorderSide(color: CustomeColors.basicTextColorGreen)),
                  //
                  //
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Text('Company Name',style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 25),),
                  //
                  //     ],
                  //
                  //   ),
                  // ),
                  data.isCompanyDetailsResponseLoaded
                  ?
                  ListView.builder(

                      physics: NeverScrollableScrollPhysics(),
                      itemCount: index,
                      shrinkWrap: true,
                      itemBuilder: (context,index)

                      {
                        CompanyDetail companyData=data.getCompanyDetailsResponse!.companyDetails[index];
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
                                  child: Text(companyData.companyName,style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
                                ),
                                InkWell(
                                  onTap: (){
                                   goto(CompanyDetails(companyData));

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
    logger.i(user_idfk);
    String body= "?user_idfk=$user_idfk";
    ApiService.getCompanyDetails(body);
}


}
