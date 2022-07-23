// To parse this JSON data, do
//
//     final getLoginResponse = getLoginResponseFromJson(jsonString);

import 'dart:convert';

GetLoginResponse getLoginResponseFromJson(String str) => GetLoginResponse.fromJson(json.decode(str));

String getLoginResponseToJson(GetLoginResponse data) => json.encode(data.toJson());

class GetLoginResponse {
  GetLoginResponse({
    required this.status,
    required this.messageResponse,
    required this.loginDetails,
  });

  bool status;
  String messageResponse;
  List<LoginDetail> loginDetails;

  factory GetLoginResponse.fromJson(Map<String, dynamic> json) => GetLoginResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
    loginDetails: List<LoginDetail>.from(json["loginDetails"].map((x) => LoginDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
    "loginDetails": List<dynamic>.from(loginDetails.map((x) => x.toJson())),
  };
}

class LoginDetail {
  LoginDetail({
    required this.id,
    required this.userName,
    required this.userEmail,
  });
  String id;
  String userName;
  String userEmail;

  factory LoginDetail.fromJson(Map<String, dynamic> json) => LoginDetail(
    id: json["id"],
    userName: json["userName"],
    userEmail: json["userEmail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "userEmail": userEmail,
  };
}
