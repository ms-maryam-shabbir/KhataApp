// To parse this JSON data, do
//
//     final updateSalesResponse = updateSalesResponseFromJson(jsonString);

import 'dart:convert';

UpdateSalesResponse updateSalesResponseFromJson(String str) => UpdateSalesResponse.fromJson(json.decode(str));

String updateSalesResponseToJson(UpdateSalesResponse data) => json.encode(data.toJson());

class UpdateSalesResponse {
  UpdateSalesResponse({
    required this.status,
    required this.messageResponse,
  });

  bool status;
  String messageResponse;

  factory UpdateSalesResponse.fromJson(Map<String, dynamic> json) => UpdateSalesResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
  };
}
