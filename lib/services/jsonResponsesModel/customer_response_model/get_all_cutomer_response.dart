// To parse this JSON data, do
//
//     final getCustomerDetailsResponse = getCustomerDetailsResponseFromJson(jsonString);

import 'dart:convert';

GetCustomerDetailsResponse getCustomerDetailsResponseFromJson(String str) => GetCustomerDetailsResponse.fromJson(json.decode(str));

String getCustomerDetailsResponseToJson(GetCustomerDetailsResponse data) => json.encode(data.toJson());

class GetCustomerDetailsResponse {
  GetCustomerDetailsResponse({
    required this.status,
    required this.messageResponse,
    required this.customerDetails,
  });

  bool status;
  String messageResponse;
  List<CustomerDetail> customerDetails;

  factory GetCustomerDetailsResponse.fromJson(Map<String, dynamic> json) => GetCustomerDetailsResponse(
    status: json["status"],
    messageResponse: json["MessageResponse"],
    customerDetails: List<CustomerDetail>.from(json["customerDetails"].map((x) => CustomerDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "MessageResponse": messageResponse,
    "customerDetails": List<dynamic>.from(customerDetails.map((x) => x.toJson())),
  };
}

class CustomerDetail {
  CustomerDetail({
    required this.id,
    required this.userIdfk,
    required this.custName,
    required this.custArea,
    required this.custNumber,
    required this.custstatus,
    required this.joiningDate,
    required this.disable,
  });

  String id;
  String userIdfk;
  String custName;
  String custArea;
  String custNumber;
  String custstatus;
  String joiningDate;
  String disable;

  factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
    id: json["id"],
    userIdfk: json["user_idfk"],
    custName: json["CustName"],
    custArea: json["CustArea"],
    custNumber: json["CustNumber"],
    custstatus: json["Custstatus"],
    joiningDate: json["JoiningDate"],
    disable: json["disable"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_idfk": userIdfk,
    "CustName": custName,
    "CustArea": custArea,
    "CustNumber": custNumber,
    "Custstatus": custstatus,
    "JoiningDate": joiningDate,
    "disable": disable,
  };
}
