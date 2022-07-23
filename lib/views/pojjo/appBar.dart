import 'package:flutter/material.dart';

import 'colors.dart';

class CustomeAppBar extends StatefulWidget {
VoidCallback onTap;
Widget? leadingIcon;
Widget? action;
String title;
CustomeAppBar(this.onTap, {this.leadingIcon



  ,this.title="",this.action});
  @override
  State<CustomeAppBar> createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        backgroundColor: CustomeColors.basicTextColorGreen,
        centerTitle: true,
        leading: InkWell(
            onTap: widget.onTap,
            child:Icon(Icons.arrow_back_ios_rounded,color: CustomeColors.basicWhite,)


        ),
        title: Text(
        widget.title
          ,
          style: TextStyle(
              color: CustomeColors.basicWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        actions: [

        ],
      ),
    );
  }
}
