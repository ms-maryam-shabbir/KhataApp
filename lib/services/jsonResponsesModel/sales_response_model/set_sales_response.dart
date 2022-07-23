// To parse this JSON data, do
//
//     final setSalesResponse = setSalesResponseFromJson(jsonString);

import 'dart:convert';

SetSalesResponse setSalesResponseFromJson(String str) => SetSalesResponse.fromJson(json.decode(str));

String setSalesResponseToJson(SetSalesResponse data) => json.encode(data.toJson());

class SetSalesResponse {
  SetSalesResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory SetSalesResponse.fromJson(Map<String, dynamic> json) => SetSalesResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
