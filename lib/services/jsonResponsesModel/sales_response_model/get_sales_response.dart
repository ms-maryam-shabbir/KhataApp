// To parse this JSON data, do
//
//     final getSalesResponse = getSalesResponseFromJson(jsonString);

import 'dart:convert';

GetSalesResponse getSalesResponseFromJson(String str) => GetSalesResponse.fromJson(json.decode(str));

String getSalesResponseToJson(GetSalesResponse data) => json.encode(data.toJson());

class GetSalesResponse {
  GetSalesResponse({
    required this.status,
    required this.messageResponse,
    required this.salesDetails,
  });

  bool status;
  String messageResponse;
  List<SalesDetail> salesDetails;

  factory GetSalesResponse.fromJson(Map<String, dynamic> json) => GetSalesResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
    salesDetails: List<SalesDetail>.from(json["SalesDetails"].map((x) => SalesDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
    "SalesDetails": List<dynamic>.from(salesDetails.map((x) => x.toJson())),
  };
}

class SalesDetail {
  SalesDetail({
    required this.id,
    required this.userIdfk,
    required this.cusFid,
    required this.productTypeId,
    required this.custName,
    required this.quantity,
    required this.pricePerKg,
    required this.total,
    required this.paidAmount,
    required this.remaingAmount,
    required this.status,
    required this.creationDate,
    required this.updateDate,
  });

  String id;
  String userIdfk;
  String cusFid;
  String productTypeId;
  String custName;
  String quantity;
  String pricePerKg;
  String total;
  String paidAmount;
  String remaingAmount;
  String status;
  String creationDate;
  String updateDate;

  factory SalesDetail.fromJson(Map<String, dynamic> json) => SalesDetail(
    id: json["id"],
    userIdfk: json["user_idfk"],
    cusFid: json["CusFid"],
    productTypeId: json["productTypeId"],
    custName: json["CustName"],
    quantity: json["Quantity"],
    pricePerKg: json["PricePerKg"],
    total: json["total"],
    paidAmount: json["paidAmount"],
    remaingAmount: json["remaingAmount"],
    status: json["status"],
    creationDate: json["creationDate"],
    updateDate: json["updateDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_idfk": userIdfk,
    "CusFid": cusFid,
    "productTypeId": productTypeId,
    "CustName": custName,
    "Quantity": quantity,
    "PricePerKg": pricePerKg,
    "total": total,
    "paidAmount": paidAmount,
    "remaingAmount": remaingAmount,
    "status": status,
    "creationDate": creationDate,
    "updateDate": updateDate,
  };
}
