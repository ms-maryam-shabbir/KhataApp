
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/firebaseData/imageUploader.dart';
import 'package:practice/views/pojjo/colors.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  ImageUploader imageUploader= ImageUploader();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        child: Column(children: [Container(
          height: Get.height/3,
          width: Get.width/2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: AssetImage(''),
            fit: BoxFit.fill,
          ),

          ),

        ),
          Container(
            width: Get.width,
            height: 50,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CustomeColors.basicTextColorGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  onPrimary: Colors.transparent,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () async {
                  imageUploader.selectFile();
                },
                child: Text(
                  "Upload Profile Image",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: CustomeColors.basicbuttonTextColorWhite),
                )),
          ),

        ],),

      ),




    );
  }
}
