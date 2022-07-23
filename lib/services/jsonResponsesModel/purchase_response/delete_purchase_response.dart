// To parse this JSON data, do
//
//     final deletePurchaseResponse = deletePurchaseResponseFromJson(jsonString);

import 'dart:convert';

DeletePurchaseResponse deletePurchaseResponseFromJson(String str) => DeletePurchaseResponse.fromJson(json.decode(str));

String deletePurchaseResponseToJson(DeletePurchaseResponse data) => json.encode(data.toJson());

class DeletePurchaseResponse {
  DeletePurchaseResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory DeletePurchaseResponse.fromJson(Map<String, dynamic> json) => DeletePurchaseResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
