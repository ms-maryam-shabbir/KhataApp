import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/views/user_credentials/sign_in.dart';
import 'package:provider/provider.dart';
import '../../controllers/map_provider/map_provider.dart';
import '../../utls/user_shared_preferences.dart';
import '../../utls/utls.dart';
import '../pojjo/colors.dart';

class Hamburger extends StatefulWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  State<Hamburger> createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  List<dynamic> userlist = UserSharedPreferences.getLoginDetail();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (builder,data,child)
  {
    return SafeArea(
      child: Container(
        width: 250,

        child: Drawer(

          child: Container(
            width: Get.width/1.5,
            color: CustomeColors.basicYellow,
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: CustomeColors.basicYellow,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 2,color: CustomeColors.basicTextColorGreen)
                      ),
                    ),
                  ),
                  Column(children: [
                    Text("${userlist[2]} ", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
                    Text("${userlist[3]}", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 10),),
                  ],)
                ],
              ),
              Divider(  height: 2,
                color: CustomeColors.basicTextColorGreen,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    openScreen(0,data);
                  },
                  // onTap:
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.home_work_sharp, color:  CustomeColors.basicTextColorGreen,),
                    ),
                    Text("Companies", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
                  ],),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    openScreen(1,data);
                  },
                  // onTap:
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.home_work_sharp, color:  CustomeColors.basicTextColorGreen,),
                    ),
                    Text("Customers", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
                  ],),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    openScreen(2,data);

                  },
                  // onTap:
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.home_work_sharp, color:  CustomeColors.basicTextColorGreen,),
                    ),
                    Text("Purchases", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
                  ],),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    openScreen(3,data);
                  },
                  // onTap:
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.home_work_sharp, color:  CustomeColors.basicTextColorGreen,),
                    ),
                    Text("Sales", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
                  ],),
                ),
              ),


























              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                  onTap: (){
                    UserSharedPreferences.sharedPreference.clear();
                    goto(SignIn(),isPrevClose: true);

                  },
                  child: Row(children: [
                    Icon(Icons.logout, color: CustomeColors.basicTextColorGreen, ),
                    Text("Logout", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 20),),
                  ],),
                ),
              ),
            ],),),

        ),


      ),
    );

  }

    );
  }



  openScreen(int index, data){
    logger.i(index);
    Navigator.of(context).pop();
    data.setScreenIndex(index);


  }

}
