import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/utls/utls.dart';
import 'package:practice/views/BottomNavigationBar/bottom_navigation_bar_page.dart';
import 'package:practice/views/user_credentials/sign_in.dart';
import 'package:provider/provider.dart';
import '../../controllers/map_provider/map_provider.dart';
import '../../utls/user_shared_preferences.dart';
import '../pojjo/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  List<dynamic> userlist = UserSharedPreferences.getLoginDetail();
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      logger.i(userlist[0]);
      if (userlist[0] == 'false' || userlist[0] == null) {
        goto(SignIn(),isPrevClose: true);
      } else {
       goto(BottomNavigateBar(),isPrevClose: true);


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(builder: (context, data, child) {
        return Container(
          color:CustomeColors.basicYellow,
          child: Center(
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    'WELCOME PAKISTAN',
                    style: TextStyle(
                        color: CustomeColors.basicTextColorGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image:  DecorationImage(
                        image: AssetImage('assets/pakistan.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: Get.height / 2.5,
                    width: Get.width
                  )
                ],
              )
            )
          )
        );
      })
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}