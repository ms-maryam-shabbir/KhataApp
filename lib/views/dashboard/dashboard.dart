import 'package:flutter/material.dart';

import '../../utls/user_shared_preferences.dart';
import '../pojjo/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {

  List<dynamic> userlist = UserSharedPreferences.getLoginDetail();
  @override
 initState(){
   super.initState();

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: CustomeColors.basicYellow,

          ),
          child: Column(children: [
Container(



),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text("Hi ${userlist[2]}! ", style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold, fontSize: 30),),
),


          ],),
        ),
      ),
    );
  }
}
