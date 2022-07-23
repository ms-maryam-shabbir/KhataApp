// To parse this JSON data, do
//
//     final getPurchaseResponse = getPurchaseResponseFromJson(jsonString);

import 'dart:convert';

GetPurchaseResponse getPurchaseResponseFromJson(String str) => GetPurchaseResponse.fromJson(json.decode(str));

String getPurchaseResponseToJson(GetPurchaseResponse data) => json.encode(data.toJson());

class GetPurchaseResponse {
  GetPurchaseResponse({
    required this.status,
    required this.messageResponse,
    required this.purchaserDetails,
  });

  bool status;
  String messageResponse;
  List<PurchaserDetail> purchaserDetails;

  factory GetPurchaseResponse.fromJson(Map<String, dynamic> json) => GetPurchaseResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
    purchaserDetails: List<PurchaserDetail>.from(json["PurchaserDetails"].map((x) => PurchaserDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
    "PurchaserDetails": List<dynamic>.from(purchaserDetails.map((x) => x.toJson())),
  };
}

class PurchaserDetail {
  PurchaserDetail({
    required this.id,
    required this.userIdfk,
    required this.comFid,
    required this.companyName,
    required this.productTypeId,
    required this.totalQuantity,
    required this.remainingQuantity,
    required this.pricePerKg,
    required this.total,
    required this.status,
    required this.paidAmount,
    required this.remainingAmount,
    required this.creationDate,
    required this.updatedDate,
  });

  String id;
  String userIdfk;
  String comFid;
  String companyName;
  String productTypeId;
  String totalQuantity;
  String remainingQuantity;
  String pricePerKg;
  String total;
  String status;
  String paidAmount;
  String remainingAmount;
  String creationDate;
  String updatedDate;

  factory PurchaserDetail.fromJson(Map<String, dynamic> json) => PurchaserDetail(
    id: json["id"],
    userIdfk: json["user_idfk"],
    comFid: json["ComFid"],
    companyName: json["CompanyName"],
    productTypeId: json["productTypeId"],
    totalQuantity: json["totalQuantity"],
    remainingQuantity: json["remainingQuantity"],
    pricePerKg: json["PricePerKg"],
    total: json["total"],
    status: json["status"],
    paidAmount: json["paidAmount"],
    remainingAmount: json["remainingAmount"],
    creationDate: json["creationDate"],
    updatedDate: json["updatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_idfk": userIdfk,
    "ComFid": comFid,
    "CompanyName": companyName,
    "productTypeId": productTypeId,
    "totalQuantity": totalQuantity,
    "remainingQuantity": remainingQuantity,
    "PricePerKg": pricePerKg,
    "total": total,
    "status": status,
    "paidAmount": paidAmount,
    "remainingAmount": remainingAmount,
    "creationDate": creationDate,
    "updatedDate": updatedDate,
  };
}
