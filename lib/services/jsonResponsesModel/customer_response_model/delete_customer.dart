// To parse this JSON data, do
//
//     final deleteCustomerDetailsResponse = deleteCustomerDetailsResponseFromJson(jsonString);

import 'dart:convert';

DeleteCustomerDetailsResponse deleteCustomerDetailsResponseFromJson(String str) => DeleteCustomerDetailsResponse.fromJson(json.decode(str));

String deleteCustomerDetailsResponseToJson(DeleteCustomerDetailsResponse data) => json.encode(data.toJson());

class DeleteCustomerDetailsResponse {
  DeleteCustomerDetailsResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory DeleteCustomerDetailsResponse.fromJson(Map<String, dynamic> json) => DeleteCustomerDetailsResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
