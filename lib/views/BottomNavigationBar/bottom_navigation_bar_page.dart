import 'package:flutter/material.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../utls/utls.dart';
import '../pojjo/colors.dart';
import 'hamburger.dart';

class BottomNavigateBar extends StatefulWidget {
  const BottomNavigateBar({Key? key}) : super(key: key);



  @override
  State<BottomNavigateBar> createState() =>
      // ignore: no_logic_in_create_state
      _BottomNavigateBarState();
}

class _BottomNavigateBarState extends State<BottomNavigateBar> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int goback = 0;


  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, data, child) {
      return WillPopScope(
        onWillPop: () async {
          if (goback == 1) {
            return true;
          } else {
            goback++;
            logger.i('Press again to exit');
            Future.delayed(Duration(seconds: 2), () {
              goback = 0;
            });
            return false;
          }
        },
        child: Scaffold(
          key: _key,
          drawer: Hamburger(),
          appBar: AppBar(
            backgroundColor: CustomeColors.basicTextColorGreen,
            centerTitle: true,
            leading: InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: CustomeColors.basicWhite,
                )


            ),
            title: Text(
              data.getTitle()
              ,
              style: TextStyle(
                  color: CustomeColors.basicWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              data.getRightIcon()
            ],
          ),
          body: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(child: data.getScreen()),
                      // Align(
                      //   alignment: Alignment(0,-0.9),
                      //   child: Container(
                      //       height: 70,
                      //       child: Row(
                      //         children: [
                      //           InkWell(
                      //               onTap: () {
                      //                 _key.currentState!.openDrawer();
                      //               },
                      //               child: Icon(Icons.menu)),
                      //           InkWell(
                      //               onTap: () {
                      //                 //_key.currentState!.openDrawer();
                      //               },
                      //               child: Icon(Icons.menu)),
                      //         ],
                      //       )),
                      // ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      );
    });
  }

}
