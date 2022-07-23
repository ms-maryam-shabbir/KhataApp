// To parse this JSON data, do
//
//     final setCompanyDetailsResponse = setCompanyDetailsResponseFromJson(jsonString);

import 'dart:convert';

SetCompanyDetailsResponse setCompanyDetailsResponseFromJson(String str) => SetCompanyDetailsResponse.fromJson(json.decode(str));

String setCompanyDetailsResponseToJson(SetCompanyDetailsResponse data) => json.encode(data.toJson());

class SetCompanyDetailsResponse {
  SetCompanyDetailsResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory SetCompanyDetailsResponse.fromJson(Map<String, dynamic> json) => SetCompanyDetailsResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
