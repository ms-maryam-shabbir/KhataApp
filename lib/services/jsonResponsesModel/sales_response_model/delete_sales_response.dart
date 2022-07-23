// To parse this JSON data, do
//
//     final deleteSalesResponse = deleteSalesResponseFromJson(jsonString);

import 'dart:convert';

DeleteSalesResponse deleteSalesResponseFromJson(String str) => DeleteSalesResponse.fromJson(json.decode(str));

String deleteSalesResponseToJson(DeleteSalesResponse data) => json.encode(data.toJson());

class DeleteSalesResponse {
  DeleteSalesResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory DeleteSalesResponse.fromJson(Map<String, dynamic> json) => DeleteSalesResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
