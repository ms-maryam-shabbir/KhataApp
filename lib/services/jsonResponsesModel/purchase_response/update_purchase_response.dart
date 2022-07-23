// To parse this JSON data, do
//
//     final updatePurchaseResponse = updatePurchaseResponseFromJson(jsonString);

import 'dart:convert';

UpdatePurchaseResponse updatePurchaseResponseFromJson(String str) => UpdatePurchaseResponse.fromJson(json.decode(str));

String updatePurchaseResponseToJson(UpdatePurchaseResponse data) => json.encode(data.toJson());

class UpdatePurchaseResponse {
  UpdatePurchaseResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory UpdatePurchaseResponse.fromJson(Map<String, dynamic> json) => UpdatePurchaseResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
