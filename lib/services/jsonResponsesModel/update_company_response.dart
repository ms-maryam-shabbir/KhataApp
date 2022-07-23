// To parse this JSON data, do
//
//     final updateCompanyDetailsResponse = updateCompanyDetailsResponseFromJson(jsonString);

import 'dart:convert';

UpdateCompanyDetailsResponse updateCompanyDetailsResponseFromJson(String str) => UpdateCompanyDetailsResponse.fromJson(json.decode(str));

String updateCompanyDetailsResponseToJson(UpdateCompanyDetailsResponse data) => json.encode(data.toJson());

class UpdateCompanyDetailsResponse {
  UpdateCompanyDetailsResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory UpdateCompanyDetailsResponse.fromJson(Map<String, dynamic> json) => UpdateCompanyDetailsResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
