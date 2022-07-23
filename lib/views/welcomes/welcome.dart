import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../maps/maps.dart';
import '../pojjo/colors.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
 @override
void checkLocation()async{

   if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
     // Navigator.of(context).pushReplacement(
     //     MaterialPageRoute(builder: (BuildContext context) => GoogleMaps()));
   }
   else
     {

     }
 }
  void initState(){
   super.initState();
   checkLocation();

 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:CustomeColors.basicYellow,
        child: Column(
          children: [
            SizedBox(height:200),
            Center(
              child: Container(
                 height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: CustomeColors.basicLessGreen,
                  borderRadius: BorderRadius.circular(100),

                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:30),
              width:180,
              child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text('Set your location',textAlign: TextAlign.center, style: TextStyle(color:CustomeColors.basicTextColorGreen,fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              Text('Enable location sharing so that your others can see where you are',
                style: TextStyle(fontSize: 15, color:CustomeColors.basicLessGreen,),textAlign: TextAlign.center,),
            ],),),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

              Icon(Icons.circle, color:CustomeColors.basicTextColorGreen,size: 18,),
              Icon(Icons.circle, color:CustomeColors.basicTextColorGreen,size: 18,),
              Icon(Icons.circle_outlined, color: CustomeColors.basicTextColorGreen,size: 18,),

            ],),),
          ],
        ),
      ),
    );
  }
}
