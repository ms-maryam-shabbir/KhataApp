import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/views/pojjo/colors.dart';
import 'package:practice/views/pojjo/inputFormField.dart';
import 'package:practice/views/user_credentials/sign_in.dart';

import '../../controllers/map_provider/map_provider.dart';
import '../../utls/user_shared_preferences.dart';
import '../../utls/utls.dart';
import '../maps/maps.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController textEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  late String _email, _password, _name;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: CustomeColors.basicYellow,
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(
              color: CustomeColors.basicTextColorGreen,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          color: CustomeColors.basicYellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'NAME',
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InputFormField(
                      onChange: (String value) {
                        formKey.currentState!.validate();
                        _name = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) return "Empty Value";
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'EMAIL',
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
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
                            primary: CustomeColors.basictransparent,
                            shadowColor: CustomeColors.basictransparent,
                            onPrimary: CustomeColors.basictransparent,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                            ),
                          ),
                          onPressed: () async {
                            // if (formKey.currentState!.validate()) {
                            //   UserCredential user =await auth.createUserWithEmailAndPassword(email: _email, password: _password)
                            //       .catchError((err) {
                            //     logger.e('Error: $err'); // Prints 401
                            //     return err;// .
                            //   });
                            //   if(user.user ==null)
                            //   {
                            //     logger.i('User Error');
                            //   }
                            //   else{
                            //     Fluttertoast.showToast(
                            //         msg: "User Created",
                            //         toastLength: Toast.LENGTH_SHORT,
                            //         gravity: ToastGravity.CENTER,
                            //         timeInSecForIosWeb: 1,
                            //         backgroundColor:  CustomeColors.basicRed,
                            //         textColor: CustomeColors.basicbuttonTextColorWhite,
                            //         fontSize: 16.0
                            //     );
                            //     await UserSharedPreferences.setUserName(_email);
                            //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //         builder: (BuildContext context) => GoogleMaps()));
                            //   }
                            // }
                            if (formKey.currentState!.validate()) {
                              String body =
                                  '?userName=$_name&userPassword=$_password&userEmail=$_email';
                              ApiService.signUp(body);
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CustomeColors.basicbuttonTextColorWhite),
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: CustomeColors.basicGrey, fontSize: 17),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignIn()));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: CustomeColors.basicTextColorGreen,
                                fontSize: 17),
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
