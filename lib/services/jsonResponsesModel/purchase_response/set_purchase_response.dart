// To parse this JSON data, do
//
//     final setPurchaseResponse = setPurchaseResponseFromJson(jsonString);

import 'dart:convert';

SetPurchaseResponse setPurchaseResponseFromJson(String str) => SetPurchaseResponse.fromJson(json.decode(str));

String setPurchaseResponseToJson(SetPurchaseResponse data) => json.encode(data.toJson());

class SetPurchaseResponse {
  SetPurchaseResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory SetPurchaseResponse.fromJson(Map<String, dynamic> json) => SetPurchaseResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
