import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/views/maps/maps.dart';
import 'package:practice/views/user_credentials/sign_up.dart';
import 'package:practice/views/welcomes/welcome.dart';

import '../../controllers/map_provider/map_provider.dart';
import '../../services/api_services.dart';
import '../../utls/user_shared_preferences.dart';
import '../../utls/utls.dart';
import '../dashboard/dashboard.dart';
import '../pojjo/colors.dart';
import '../pojjo/inputFormField.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController textEditingController = TextEditingController();
  var _email='', _password='';
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor:   CustomeColors.basicYellow,
        centerTitle: true,
        title: Text(
          'Sign In',
          style: TextStyle(color: CustomeColors.basicTextColorGreen, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(

        key: formKey,
        child: Container(
          color:CustomeColors.basicYellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [ Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'EMAIL',
                    style: TextStyle(fontWeight: FontWeight.bold, color: CustomeColors.basicTextColorGreen,),
                  ),
                ),
                  InputFormField(
                    onChange: (String value) {
                      formKey.currentState!.validate();
                      _email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty)
                        return "Empty Value";
                      else if (!isEmail(value)) {
                        return "Invalid Mail";
                      } else
                        return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'PASSWORD',
                      style: TextStyle(fontWeight: FontWeight.bold, color:  CustomeColors.basicTextColorGreen,),
                    ),
                  ),
                  InputFormField(
                    obscure: isObscure ? true : false,
                    suffIcon: InkWell(
                        onTap: () {
                          isObscure = !isObscure;
                          setState(() {});
                        },
                        child: Icon(
                          isObscure
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )),
                    onChange: (String value) {
                      formKey.currentState!.validate();
                      _password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) return "Empty Value";
                      return null;
                    },
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
                          if (formKey.currentState!.validate()) {}
                          String body="?userPassword=$_password&userEmail=$_email";

                           ApiService.login(body);

                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: CustomeColors.basicbuttonTextColorWhite),
                        )),
                  ),
                  ],),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(top: 12),
              //       width: Get.width / 4,
              //       height: 1,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 1, color: Colors.grey)),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              //       child: Text(
              //         'OR SIGN IN WITH',
              //         style: TextStyle(
              //             color: Colors.grey,
              //             fontSize: 17,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(top: 12),
              //       width: Get.width / 4,
              //       height: 1,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 1, color: Colors.grey)),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 50.0),
              //       child: Container(
              //         child: Icon(
              //           Icons.facebook,
              //           color: Colors.grey.withOpacity(0.5),
              //           size: 60,
              //         ),
              //       ),
              //     ),
              //     Container(
              //       child: Icon(
              //         Icons.add_circle,
              //         color: Colors.grey.withOpacity(0.5),
              //         size: 60,
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(right: 50.0),
              //       child: Container(
              //         child: Icon(
              //           Icons.add_alert,
              //           color: Colors.grey.withOpacity(0.5),
              //           size: 60,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: CustomeColors.basicTextColorGreen, fontSize: 17),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
