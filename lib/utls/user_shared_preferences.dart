import 'package:practice/controllers/map_provider/map_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences
{
  static const keyuserName='_keyuserName';
  static const keyuserEmail='keyuserEmail';
  static const keyuserId='keyuserId';
  static const keyUserLogin='false';



  static late SharedPreferences sharedPreference;
 static Future init() async{
    sharedPreference= await SharedPreferences.getInstance();
  }

 static Future setUserName(bool userLogin, int userId, String userName, String userEmail) async{
   await sharedPreference.setBool(keyUserLogin, userLogin);
   await sharedPreference.setString(keyuserName, userName);
   await sharedPreference.setString(keyuserEmail, userEmail);
   await sharedPreference.setInt(keyuserId, userId);
// logger.e(keyUserLogin);
// logger.i(userLogin);
 }
// static  Future<dynamic> myLocalStorage({bool isSaveRequired: false, dynamic key, dynamic value}) async {
//
//
//     if (isSaveRequired) {
//       if (value is int) {
//         return sharedPreference.setInt(key, value);
//       } else if (value is String) {
//         return sharedPreference.setString(key, value);
//       } else if (value is bool) {
//         return sharedPreference.setBool(key, value);
//       }
//     }
//     else {
//       return sharedPreference.get(key);
//     }
//   }
//
//  static Future<dynamic> getUserAllDetails()async{
//
//
//     var isUserLogin=await myLocalStorage(key:keyUserLogin);
//     var userName=await myLocalStorage(key:keyuserName);
//     var usermail=await myLocalStorage(key:keyuserEmail);
//     return [isUserLogin,userName,usermail];
//   }
static dynamic getLoginDetail() {
   var userName=sharedPreference.getString(keyuserName);
   var userMail=sharedPreference.getString(keyuserEmail);
   var isUserLogin=sharedPreference.getBool(keyUserLogin);
   var userId=sharedPreference.getInt(keyuserId);
  return [isUserLogin,userId,userName,userMail];
}


}