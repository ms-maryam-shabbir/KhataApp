
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:practice/services/jsonResponsesModel/delete_company.dart';
import 'package:practice/services/jsonResponsesModel/get_all_company_details_response.dart';
import 'package:practice/services/jsonResponsesModel/get_login_response.dart';
import 'package:practice/services/jsonResponsesModel/get_sign_up.dart';
import 'package:practice/services/jsonResponsesModel/sales_response_model/delete_sales_response.dart';
import 'package:practice/services/jsonResponsesModel/sales_response_model/get_sales_response.dart';
import 'package:practice/services/jsonResponsesModel/sales_response_model/set_sales_response.dart';
import 'package:practice/services/jsonResponsesModel/set_new_company_response_model.dart';
import 'package:practice/views/dashboard/dashboard.dart';
import 'package:provider/provider.dart';
import '../controllers/user_provider/user_provider.dart';
import '../utls/user_shared_preferences.dart';
import '../utls/utls.dart';
import 'jsonResponsesModel/customer_response_model/delete_customer.dart';
import 'jsonResponsesModel/customer_response_model/edit_customer_response.dart';
import 'jsonResponsesModel/customer_response_model/get_all_cutomer_response.dart';
import 'jsonResponsesModel/customer_response_model/set_new_customer_response.dart';
import 'jsonResponsesModel/purchase_response/purchase_on_credit_response.dart';
import 'jsonResponsesModel/purchase_response/delete_purchase_response.dart';
import 'jsonResponsesModel/purchase_response/get_purchase_response.dart';
import 'jsonResponsesModel/purchase_response/set_purchase_payment.dart';
import 'jsonResponsesModel/purchase_response/set_purchase_response.dart';
import 'jsonResponsesModel/purchase_response/update_purchase_response.dart';
import 'jsonResponsesModel/sales_response_model/update_sales_response.dart';
import 'jsonResponsesModel/update_company_response.dart';

class ApiService {

  //URLssss
  static const _BASE_URL = 'https://tamam.com.pk/KhataApp/';
  static const _SIGN_UP = 'signUp.php';
  static const _SIGN_IN = 'login.php';
  static const _GET_COMPANY_DETAILS = 'getAllCompaniesDetail.php';
  static const _SET_COMPANY_DETAILS = 'setNewCompany.php';
  static const _UPDATE_COMPANY_DETAILS = 'updateCompanyDetails.php';
  static const _DELETE_COMPANY_DETAILS = 'deteleCompany.php';
  static const _DELETE_CUSTOMER = 'deleteCustomer.php';
  static const _UPDATE_CUSTOMER = 'updateCustomer.php';
  static const _SET_NEW_CUSTOMER = 'setNewCutomer.php';
  static const _GET_ALL_CUSTOMER = 'getAllCustomer.php';
  static const _DELETE_PURCHASE = 'deletePurchaseTransaction.php';
  static const _UPDATE_PURCHASE = 'updatePurchaseTransaction.php';
  static const _SET_NEW_PURCHASE = 'setPurchaseTransaction.php';
  static const _GET_ALL_PURCHASE = 'getPurchaseTransaction.php';
  static const _GET_PURCHASE_ON_CREDIT= 'getPurchaseOnCredit.php';
  static const _SET_PURCHASE_PAYMENT= 'setPurchasePaymentHistory.php';
  static const _DELETE_SALES = 'deleteSalesTransaction.php';
  static const _UPDATE_SALES  = 'updateSalesTransaction.php';
  static const _SET_NEW_SALES = 'setSalesTransaction.php';
  static const _GET_ALL_SALES  = 'getSalesTransaction.php';
  static  var userProviderApi = Provider.of<UserProvider>(Get.context!,listen: false);
  static List<dynamic> userDetailList= UserSharedPreferences.getLoginDetail();
  static var fid=userDetailList[1];
//   REQUEST GENERATOR
  static Future<dynamic> _request(
      {String feedURL = "",
      String body = "",
      String requestType = "POST"}) async {
    var request = http.Request(requestType, Uri.parse('$_BASE_URL$feedURL'));
    if (requestType == 'GET') {
    } else if (requestType == 'POST') {
      request.body = body;
    }

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
   String body=   await response.stream.bytesToString();
return body;
   //logger.i(body);

    } else {
      String body=   await response.stream.bytesToString();
    //  logger.i(body);
      return body;
    }

  }

  static void signUp(String body) async {
    _request(feedURL: _SIGN_UP + body, requestType: 'GET').then((value) {
      logger.i('after request'+ value.toString());
      var signUpResponseFromJson = getSignUpResponseFromJson(value.toString());

      if (signUpResponseFromJson.status!) {
        logger.i(signUpResponseFromJson.messageResponse);
      } else {
        logger.i(signUpResponseFromJson.messageResponse);
      }
    });
  }


  static void login(String body) async {
    //logger.e('before request'+body);
    _request(feedURL: _SIGN_IN + body, requestType: 'GET').then((value)  {
      logger.e('after request'+ value.toString());
      var loginResponseFromJson= getLoginResponseFromJson(value.toString());

      if(loginResponseFromJson.status)
        {

          var loginDetails=loginResponseFromJson.loginDetails[0];
         UserSharedPreferences.setUserName(true,int.parse(loginDetails.id), loginDetails.userName, loginDetails.userEmail);

          goto(DashboardScreen(), isPrevClose: true);
         // goto(AllCompaniesDetail());
        //  logger.i('MessageResponse');
       //   logger.i(loginResponseFromJson.messageResponse);
        }
      else
        {
          logger.i(loginResponseFromJson.messageResponse);
        }


    });



  }

  static void getCompanyDetails(String body){
    _request(feedURL: _GET_COMPANY_DETAILS+body,requestType: 'GET' ).then((value){
      logger.i(value.toString());
      var getCompanyDetails=getCompanyDetailsResponseFromJson(value.toString());
      if(getCompanyDetails.status)
        {
          userProviderApi.setCompanyDetails(getCompanyDetails,true);
          logger.e(getCompanyDetails.messageResponse);
        }
      else
        {
          logger.e(getCompanyDetails.messageResponse);
        }
    });




  }

  static void addNewCompany(String body)
  {
_request(feedURL:_SET_COMPANY_DETAILS+body, requestType: 'GET' ).then((value)  {

  var addNewCompany= setCompanyDetailsResponseFromJson(value.toString());
  if(addNewCompany.status)
    {
      logger.i(getBody);
      getCompanyDetails(getBody);
      logger.i(addNewCompany.messageResponse);
    }
  else
    {

    }
});

  }
static void updateCompany(String body){
    _request(feedURL: _UPDATE_COMPANY_DETAILS+body, requestType: 'GET').then((value) {

      var updateCompany= updateCompanyDetailsResponseFromJson(value.toString());
      if(updateCompany.status)
        {
          logger.e(updateCompany.messageResponse);
          getCompanyDetails(getBody);
        }
      else
        {
          logger.e(updateCompany.messageResponse);
        }


    });


}
  static void deleteCompany(String body){
    _request(feedURL: _DELETE_COMPANY_DETAILS+body, requestType: 'GET').then((value) {

      var deleteCompany= deleteCompanyDetailsResponseFromJson(value.toString());
      if(deleteCompany.status)
      {
        logger.e(deleteCompany.messageResponse);
        getCompanyDetails(getBody);
      }
      else
      {
        logger.e(deleteCompany.messageResponse);
      }


    });


  }


  ///////////////////////////////
  static void getCustomerDetails(String body){
    _request(feedURL: _GET_ALL_CUSTOMER+body,requestType: 'GET' ).then((value){
      logger.i(value.toString());
      var getCustomerDetails=getCustomerDetailsResponseFromJson(value.toString());
      if(getCustomerDetails.status)
      {
        userProviderApi.setCustomer(getCustomerDetails,true);
        logger.e(getCustomerDetails.messageResponse);
      }
      else
      {
        logger.e(getCustomerDetails.messageResponse);
      }
    });




  }
  static void addNewCustomer(String body)
  {
    _request(feedURL:_SET_NEW_CUSTOMER+body, requestType: 'GET' ).then((value)  {

      var addNewCustomer= setNewCustomerResponseFromJson(value.toString());
      if(addNewCustomer.status)
      {
        logger.i(getBody);
        getCustomerDetails(getBody);
        logger.i(addNewCustomer.messageResponse);
      }
      else
      {

      }
    });

  }
  static void updateCustomer(String body){
    _request(feedURL: _UPDATE_CUSTOMER+body, requestType: 'GET').then((value) {

      var updateCutomer= updateCustomerDetailsResponseFromJson(value.toString());
      if(updateCutomer.status)
      {
        logger.e(updateCutomer.messageResponse);
        getCustomerDetails(getBody);
      }
      else
      {
        logger.e(updateCutomer.messageResponse);
      }


    });


  }
  static void deleteCustomer(String body){
    _request(feedURL: _DELETE_CUSTOMER+body, requestType: 'GET').then((value) {

      var deleteCustomer= deleteCustomerDetailsResponseFromJson(value.toString());
      if(deleteCustomer.status)
      {
        logger.e(deleteCustomer.messageResponse);
        getCustomerDetails(getBody);
      }
      else
      {
        logger.e(deleteCustomer.messageResponse);
      }
    });


  }


////////////////////////////////////////////
  static void getPurchaseDetails(String body){
    _request(feedURL: _GET_ALL_PURCHASE+body,requestType: 'GET' ).then((value){
      logger.i(value.toString());
      var getPurchaseDetails=getPurchaseResponseFromJson(value.toString());
      if(getPurchaseDetails.status)
      {
        userProviderApi.setPurchases(getPurchaseDetails,true);
        logger.e(getPurchaseDetails.messageResponse);
      }
      else
      {
        logger.e(getPurchaseDetails.messageResponse);
      }
    });




  }
  static void addNewPurchase(String body)
  {
    _request(feedURL:_SET_NEW_PURCHASE+body, requestType: 'GET' ).then((value)  {

      var addNewPurchase= setPurchaseResponseFromJson(value.toString());
      if(addNewPurchase.status)
      {
        logger.i(getBody);
        getPurchaseDetails(getBody);
        logger.i(addNewPurchase.messageResponse);
      }
      else
      {

      }
    });

  }
  static void updatePurchase(String body){
    _request(feedURL: _UPDATE_PURCHASE+body, requestType: 'GET').then((value) {

      var updatePurchase= updatePurchaseResponseFromJson(value.toString());
      if(updatePurchase.status)
      {
        logger.e(updatePurchase.messageResponse);
        getPurchaseDetails(getBody);
      }
      else
      {
        logger.e(updatePurchase.messageResponse);
      }


    });


  }
  static void deletePurchase(String body){
    _request(feedURL: _DELETE_PURCHASE+body, requestType: 'GET').then((value) {

      var deletePurchase= deletePurchaseResponseFromJson(value.toString());
      if(deletePurchase.status)
      {
        logger.e(deletePurchase.messageResponse);
        getPurchaseDetails(getBody);
      }
      else
      {
        logger.e(deletePurchase.messageResponse);
      }
    });


  }
  static void getPurchasesOnCredit(String body){
    _request(feedURL:  _GET_PURCHASE_ON_CREDIT
        +body,requestType: 'GET' ).then((value){
      logger.i(value.toString());
      var getPurchaseOnCreditPurchaseDetails=getPurchaseOnCreditResponseFromJson(value.toString());
      if(getPurchaseOnCreditPurchaseDetails.status)
      {
        userProviderApi.setPurchaseOnCredit(getPurchaseOnCreditPurchaseDetails,true);

        logger.e(getPurchaseOnCreditPurchaseDetails.messageResponse);
      }
      else
      {
        logger.e(getPurchaseOnCreditPurchaseDetails.messageResponse);
      }
    });




  }
  static void addNewPaymentToPurchase(String body)
  {
    _request(feedURL:_SET_PURCHASE_PAYMENT+body, requestType: 'GET' ).then((value)  {

      var setPurchasePayment= setPurchasePaymentResponseFromJson(value.toString());
      if(setPurchasePayment.status)
      {

        getPurchaseDetails(getBody);
        TOASTS(setPurchasePayment.messageResponse);
        
      }
      else
      {
        TOASTS(setPurchasePayment.messageResponse);
      }
    });

  }
  /////////////////////////////////////////

////////////////////////////////////////////
  static void getSalesDetails(String body){
    _request(feedURL: _GET_ALL_SALES+body,requestType: 'GET' ).then((value){
      logger.i(value.toString());
      var getSalesDetails=getSalesResponseFromJson(value.toString());
      if(getSalesDetails.status)
      {
        userProviderApi.setSales(getSalesDetails,true);
        logger.e(getSalesDetails.messageResponse);
      }
      else
      {
        logger.e(getSalesDetails.messageResponse);
      }
    });




  }
  static void addNewSales(String body)
  {
    _request(feedURL:_SET_NEW_SALES+body, requestType: 'GET' ).then((value)  {

      var addNewSales= setSalesResponseFromJson(value.toString());
      if(addNewSales.status)
      {
        logger.i(getBody);
        getSalesDetails(getBody);
        logger.i(addNewSales.messageResponse);
      }
      else
      {

      }
    });

  }
  static void updateSales(String body){
    _request(feedURL: _UPDATE_SALES+body, requestType: 'GET').then((value) {

      var updateSales= updateSalesResponseFromJson(value.toString());
      if(updateSales.status)
      {
        logger.e(updateSales.messageResponse);
        getSalesDetails(getBody);
      }
      else
      {
        logger.e(updateSales.messageResponse);
      }


    });


  }
  static void deleteSales(String body){
    _request(feedURL: _DELETE_SALES+body, requestType: 'GET').then((value) {

      var deleteSales= deleteSalesResponseFromJson(value.toString());
      if(deleteSales.status)
      {
        logger.e(deleteSales.messageResponse);
        getSalesDetails(getBody);
      }
      else
      {
        logger.e(deleteSales.messageResponse);
      }
    });


  }



























  static var getBody="?user_idfk=$fid";
}
