import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/services/jsonResponsesModel/get_all_company_details_response.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/company/add_new_company.dart';
import 'package:practice/views/company/all_companies.dart';
import '../pojjo/colors.dart';

class CompanyDetails extends StatefulWidget {
  CompanyDetail companyData;

  CompanyDetails(this.companyData);
  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
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
        title: Text(widget.companyData.companyName, style: TextStyle(color: CustomeColors.basicWhite,fontSize: 20, fontWeight: FontWeight.bold ),),



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
                        Expanded(flex:1, child: Text("Name", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(flex:2, child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(widget.companyData.companyName, style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

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
                            child: Text("Location", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(
                            flex:2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(widget.companyData.companyArea, style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

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
                            child: Text("Owner Name", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(
                            flex:2,
                            child: Container(
                                alignment: Alignment.centerRight,
                            child: Text(widget.companyData.compOwenerName, style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

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
                            child: Text("Contact Number", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(
                            flex:2,
                            child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(widget.companyData.number, style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

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
                            child: Text("Joining Date", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),)),
                        Expanded(
                            flex:2,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(widget.companyData.joiningDate.toString().split(' ')[0], style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 15),))),

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
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () async {
                              goto(AddNewCompany(companyData: widget.companyData,));

                            },
                            child: Text(
                              "Edit Company",
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
                              var id=widget.companyData.id;
                              String body="?id=$id";
ApiService.deleteCompany(body);
goto(AllCompaniesDetail(), isPrevClose: true);
                            },
                            child: Text(
                              "Delete Company",
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
