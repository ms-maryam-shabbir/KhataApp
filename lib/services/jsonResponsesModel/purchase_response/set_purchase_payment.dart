// To parse this JSON data, do
//
//     final setPurchasePaymentResponse = setPurchasePaymentResponseFromJson(jsonString);

import 'dart:convert';

SetPurchasePaymentResponse setPurchasePaymentResponseFromJson(String str) => SetPurchasePaymentResponse.fromJson(json.decode(str));

String setPurchasePaymentResponseToJson(SetPurchasePaymentResponse data) => json.encode(data.toJson());

class SetPurchasePaymentResponse {
  SetPurchasePaymentResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory SetPurchasePaymentResponse.fromJson(Map<String, dynamic> json) => SetPurchasePaymentResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
