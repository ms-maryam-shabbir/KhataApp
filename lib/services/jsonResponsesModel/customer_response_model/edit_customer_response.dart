// To parse this JSON data, do
//
//     final updateCustomerDetailsResponse = updateCustomerDetailsResponseFromJson(jsonString);

import 'dart:convert';

UpdateCustomerDetailsResponse updateCustomerDetailsResponseFromJson(String str) => UpdateCustomerDetailsResponse.fromJson(json.decode(str));

String updateCustomerDetailsResponseToJson(UpdateCustomerDetailsResponse data) => json.encode(data.toJson());

class UpdateCustomerDetailsResponse {
  UpdateCustomerDetailsResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory UpdateCustomerDetailsResponse.fromJson(Map<String, dynamic> json) => UpdateCustomerDetailsResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
