// To parse this JSON data, do
//
//     final getPurchaseOnCreditResponse = getPurchaseOnCreditResponseFromJson(jsonString);

import 'dart:convert';


GetPurchaseOnCreditResponse getPurchaseOnCreditResponseFromJson(String str) => GetPurchaseOnCreditResponse.fromJson(json.decode(str));

String getPurchaseOnCreditResponseToJson(GetPurchaseOnCreditResponse data) => json.encode(data.toJson());

class GetPurchaseOnCreditResponse {
  GetPurchaseOnCreditResponse({
    required this.status,
    required this.messageResponse,
    required this.purchaseOnCreditDetails,
  });

  bool status;
  String messageResponse;
  List<PurchaseOnCreditDetail> purchaseOnCreditDetails;

  factory GetPurchaseOnCreditResponse.fromJson(Map<String, dynamic> json) => GetPurchaseOnCreditResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
    purchaseOnCreditDetails: List<PurchaseOnCreditDetail>.from(json["PurchaseOnCreditDetails"].map((x) => PurchaseOnCreditDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
    "PurchaseOnCreditDetails": List<dynamic>.from(purchaseOnCreditDetails.map((x) => x.toJson())),
  };
}

class PurchaseOnCreditDetail {
  PurchaseOnCreditDetail({
    required this.id,
    required this.userIdfk,
    required this.comFid,
    required this.productTypeId,
    required this.companyName,
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
  String productTypeId;
  String companyName;
  String totalQuantity;
  String remainingQuantity;
  String pricePerKg;
  String total;
  String status;
  String paidAmount;
  String remainingAmount;
  String creationDate;
  String updatedDate;

  factory PurchaseOnCreditDetail.fromJson(Map<String, dynamic> json) => PurchaseOnCreditDetail(
    id: json["id"],
    userIdfk: json["user_idfk"],
    comFid: json["ComFid"],
    productTypeId: json["productTypeId"],
    companyName: json["CompanyName"],
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
    "productTypeId": productTypeId,
    "CompanyName": companyName,
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
