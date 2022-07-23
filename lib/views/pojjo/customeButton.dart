import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

class CustomeButton extends StatefulWidget {
  String title;

  VoidCallback onPressed;
CustomeButton(this.title,this.onPressed);
  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Get.width,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomeColors.basicbuttonTextColorWhite),
          )),
    );
  }
}
