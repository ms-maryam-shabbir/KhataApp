// To parse this JSON data, do
//
//     final getCompanyDetailsResponse = getCompanyDetailsResponseFromJson(jsonString);

import 'dart:convert';

GetCompanyDetailsResponse getCompanyDetailsResponseFromJson(String str) => GetCompanyDetailsResponse.fromJson(json.decode(str));

String getCompanyDetailsResponseToJson(GetCompanyDetailsResponse data) => json.encode(data.toJson());

class GetCompanyDetailsResponse {
  GetCompanyDetailsResponse({
    required this.status,
    required this.messageResponse,
    required this.companyDetails,
  });

  bool status;
  String messageResponse;
  List<CompanyDetail> companyDetails;

  factory GetCompanyDetailsResponse.fromJson(Map<String, dynamic> json) => GetCompanyDetailsResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
    companyDetails: List<CompanyDetail>.from(json["companyDetails"].map((x) => CompanyDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
    "companyDetails": List<dynamic>.from(companyDetails.map((x) => x.toJson())),
  };
}

class CompanyDetail {
  CompanyDetail({
    required this.id,
    required this.userIdfk,
    required this.companyName,
    required this.companyArea,
    required this.number,
    required this.companyStatus,
    required this.compOwenerName,
    required this.joiningDate,
  });

  String id;
  String userIdfk;
  String companyName;
  String companyArea;
  String number;
  String companyStatus;
  String compOwenerName;
  String joiningDate;

  factory CompanyDetail.fromJson(Map<String, dynamic> json) => CompanyDetail(
    id: json["id"],
    userIdfk: json["user_idfk"],
    companyName: json["CompanyName"],
    companyArea: json["CompanyArea"],
    number: json["number"],
    companyStatus: json["CompanyStatus"],
    compOwenerName: json["CompOwenerName"],
    joiningDate: json["JoiningDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_idfk": userIdfk,
    "CompanyName": companyName,
    "CompanyArea": companyArea,
    "number": number,
    "CompanyStatus": companyStatus,
    "CompOwenerName": compOwenerName,
    "JoiningDate": joiningDate,
  };
}
