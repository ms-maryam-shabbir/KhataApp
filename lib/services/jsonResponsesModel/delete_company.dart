// To parse this JSON data, do
//
//     final deleteCompanyDetailsResponse = deleteCompanyDetailsResponseFromJson(jsonString);

import 'dart:convert';

DeleteCompanyDetailsResponse deleteCompanyDetailsResponseFromJson(String str) => DeleteCompanyDetailsResponse.fromJson(json.decode(str));

String deleteCompanyDetailsResponseToJson(DeleteCompanyDetailsResponse data) => json.encode(data.toJson());

class DeleteCompanyDetailsResponse {
  DeleteCompanyDetailsResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory DeleteCompanyDetailsResponse.fromJson(Map<String, dynamic> json) => DeleteCompanyDetailsResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
