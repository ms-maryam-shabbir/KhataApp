// To parse this JSON data, do
//
//     final getSignUpResponse = getSignUpResponseFromJson(jsonString);

import 'dart:convert';

GetSignUpResponse getSignUpResponseFromJson(String str) => GetSignUpResponse.fromJson(json.decode(str));

String getSignUpResponseToJson(GetSignUpResponse data) => json.encode(data.toJson());

class GetSignUpResponse {
  GetSignUpResponse({
    required this.status,
    required this.messageResponse,
  });

  bool? status;
  String? messageResponse;

  factory GetSignUpResponse.fromJson(Map<String, dynamic> json) => GetSignUpResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
