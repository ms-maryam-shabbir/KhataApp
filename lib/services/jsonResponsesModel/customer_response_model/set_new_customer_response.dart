// To parse this JSON data, do
//
//     final setNewCustomerResponse = setNewCustomerResponseFromJson(jsonString);

import 'dart:convert';

SetNewCustomerResponse setNewCustomerResponseFromJson(String str) => SetNewCustomerResponse.fromJson(json.decode(str));

String setNewCustomerResponseToJson(SetNewCustomerResponse data) => json.encode(data.toJson());

class SetNewCustomerResponse {
  SetNewCustomerResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory SetNewCustomerResponse.fromJson(Map<String, dynamic> json) => SetNewCustomerResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
