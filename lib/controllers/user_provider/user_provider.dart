import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/services/jsonResponsesModel/get_all_company_details_response.dart';
import 'package:practice/services/jsonResponsesModel/sales_response_model/get_sales_response.dart';
import 'package:practice/views/company/add_new_company.dart';
import 'package:practice/views/company/all_companies.dart';
import 'package:practice/views/customers/add_new_customer.dart';
import 'package:practice/views/customers/all_customers.dart';
import 'package:practice/views/purchase/add_new_purchases.dart';
import 'package:practice/views/purchase/purchases.dart';
import 'package:practice/views/sales/add_new_sales.dart';
import 'package:practice/views/sales/all_sales.dart';
import 'package:provider/provider.dart';
import '../../services/jsonResponsesModel/customer_response_model/get_all_cutomer_response.dart';
import '../../services/jsonResponsesModel/purchase_response/purchase_on_credit_response.dart';
import '../../services/jsonResponsesModel/purchase_response/get_purchase_response.dart';
import '../../utls/utls.dart';
var userProvider = Provider.of<UserProvider>(Get.context!, listen: false);

class UserProvider extends ChangeNotifier {
  List<Widget> screens = [
    // DashboardScreen(),
    AllCompaniesDetail(),
    AllCustomersDetail(),
    PurchasesScreen(),
    AllSalesDetails(),

  ];
  int _index = 0;
  int index = 0;

  getScreen() {
    if (_index >= 0) {
      return screens[_index];
    }
  }

  void setScreenIndex(int value) {
    _index = value;
    notifyListeners();
  }

  int getIndex() {
    return _index;
  }

  getTitle() {
    String? title;
    if (_index == 0) {
      title = "All Companies";
      return title;
    } else if (_index == 1) {
      title = "All Customers";
      return title;
    } else if (_index == 2) {
      title = "Purchases";
      return title;
    } else if (_index == 3) {
      title = "All Sales";
      return title;

    }
    else if (_index > 3) {
      logger.i("455555555555555555555555555555555555555555555555555555555555");
      title = "";
      return title;
    }
  }

  getRightIcon() {
    if (_index == 0) {
      return InkWell(
        onTap: () {
          goto(AddNewCompany());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      );
    }
    else if (_index == 1) {
      return InkWell(
        onTap: () {
          goto(AddNewCustomer());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      );
    }
    else if (_index == 2) {
      return InkWell(
        onTap: () {
          goto(AddNewPurchase());

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      );
    }
    else if (_index == 3) {
      return InkWell(
        onTap: () {
          goto(AddNewSales());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      );
    }

    else {
      return Container();
    }


  }

  var companyName, amount, quantity, remainingQuantity, RemainingAmount;

  getPurchaseData(
    int dataType,
    Widget widgetType,
  ) {}

  editPurchaseData(Widget widgetType) {}

  bool isCompanyDetailsResponseLoaded = false;
  GetCompanyDetailsResponse? getCompanyDetailsResponse;

  void setCompanyDetails(GetCompanyDetailsResponse getCompanyDetailsResponse,
      bool isCompanyDetailsResponseLoaded) {
    this.isCompanyDetailsResponseLoaded = isCompanyDetailsResponseLoaded;
    this.isCompanyDetailsResponseLoaded = isCompanyDetailsResponseLoaded;
    this.getCompanyDetailsResponse = null;
    notifyListeners();
    this.getCompanyDetailsResponse = getCompanyDetailsResponse;
    notifyListeners();
  }

  bool isCustomerDataLoaded = false;
  GetCustomerDetailsResponse? getCustomerDetailsResponse;

  void setCustomer(GetCustomerDetailsResponse getCustomerDetailsResponse,
      bool isCustomerDataLoaded) {
    this.getCustomerDetailsResponse = getCustomerDetailsResponse;
    this.isCustomerDataLoaded = isCustomerDataLoaded;
    this.getCustomerDetailsResponse = null;
    notifyListeners();
    this.getCustomerDetailsResponse = getCustomerDetailsResponse;
    notifyListeners();
  }

  bool isPurchaseDataLoaded = false;
  GetPurchaseResponse? getPurchaseResponse;

  void setPurchases(
      GetPurchaseResponse getPurchaseResponse, bool isPurchaseDataLoaded) {
    this.getPurchaseResponse = getPurchaseResponse;
    this.isPurchaseDataLoaded = isPurchaseDataLoaded;
    this.getPurchaseResponse = null;
    notifyListeners();
    this.getPurchaseResponse = getPurchaseResponse;
    notifyListeners();
  }

  bool isPurchaseOnCreditLoaded = false;
  GetPurchaseOnCreditResponse? getPurchaseOnCreditResponse;

  void setPurchaseOnCredit(
      GetPurchaseOnCreditResponse getPurchaseOnCreditResponse,
      bool isPurchaseOnCreditLoaded) {
    this.getPurchaseOnCreditResponse = getPurchaseOnCreditResponse;
    this.isPurchaseOnCreditLoaded = isPurchaseOnCreditLoaded;
    this.getPurchaseOnCreditResponse = null;
    notifyListeners();
    this.getPurchaseOnCreditResponse = getPurchaseOnCreditResponse;
    notifyListeners();
  }

  bool isSalesDataLoaded = false;
  GetSalesResponse? getSalesResponse;

  void setSales(GetSalesResponse getSalesResponse, bool isSalesDataLoaded) {
    this.getSalesResponse = getSalesResponse;
    this.isSalesDataLoaded = isSalesDataLoaded;
    this.getSalesResponse = null;
    notifyListeners();
    this.getSalesResponse = getSalesResponse;
    notifyListeners();
  }
}
