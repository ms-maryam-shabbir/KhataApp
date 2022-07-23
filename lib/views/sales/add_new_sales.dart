import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/services/jsonResponsesModel/customer_response_model/get_all_cutomer_response.dart';
import 'package:practice/services/jsonResponsesModel/purchase_response/get_purchase_response.dart';
import 'package:practice/services/jsonResponsesModel/sales_response_model/get_sales_response.dart';
import 'package:practice/views/AppExpenpsionTile.dart';
import 'package:practice/views/pojjo/customeButton.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utls/user_shared_preferences.dart';
import '../../utls/utls.dart';
import '../pojjo/colors.dart';
import '../pojjo/inputFormField.dart';
import 'all_sales.dart';



class AddNewSales extends StatefulWidget {
  SalesDetail? salesData;

  AddNewSales({this.salesData});

  @override
  State<AddNewSales> createState() => _AddNewSalesState();
}

class _AddNewSalesState extends State<AddNewSales> {
  final salesKey = GlobalKey<FormState>();

  CalendarController? _controller;
  TextEditingController? _Quantity;
  TextEditingController? _PricePerKg;
  TextEditingController? _status;
  TextEditingController? _total;
  TextEditingController? _paidAmount;

  // TextEditingController? _total;

  var total = 0;

  String? _dueDate;
  String status = "2";
  DateTime? dateTime;
  String selectedValue = "USA";
  String? custName;

  String? custId;
  String? remainStock;
  String? pFid;
  String? stock;
  String? productTypeId;
  String? companyName;
  List<dynamic> userlist = [];
  List<CustomerDetail> items = [];
  List<PurchaserDetail> AvailableStock = [];
  List<String> statusType = ['Fully Recieved', 'Half Recieved', 'Not Recieved'];
  bool isCustomer = true;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.parse(widget.salesData == null
        ? DateTime.now().toString()
        : widget.salesData!.creationDate);

    _Quantity = TextEditingController(
        text: widget.salesData == null ? '' : widget.salesData!.quantity);
    _PricePerKg = TextEditingController(
        text: widget.salesData == null ? '' : widget.salesData!.pricePerKg);
    _status = TextEditingController(
        text: widget.salesData == null ? '' : widget.salesData!.status);
    _total = TextEditingController(
        text: widget.salesData == null ? '' : widget.salesData!.total);
    _paidAmount = TextEditingController(
        text: widget.salesData == null ? '' : widget.salesData!.paidAmount);
    status = widget.salesData == null ? '' : widget.salesData!.status;
    productTypeId =
        widget.salesData == null ? '' : widget.salesData!.productTypeId;
    custId = widget.salesData == null ? '' : widget.salesData!.custName;
    // pFid = widget.salesData == null ? '' : widget.salesData!.;
    getData();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _Quantity!.dispose();
    _PricePerKg!.dispose();
    _status!.dispose();
    _total!.dispose();
    _paidAmount!.dispose();
    _controller!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<UserProvider>(builder: (context, data, child) {
        if (data.isCustomerDataLoaded) {
          items = data.getCustomerDetailsResponse!.customerDetails;
        } else {
          logger.i('getCustomerDetailsResponse false');
        }
        if (data.isPurchaseDataLoaded) {
          AvailableStock = data.getPurchaseResponse!.purchaserDetails;
        } else {
          logger.i('isCompanyDetailsResponseLoaded false');
        }
        final GlobalKey<AppExpansionTileState> expansionTile = GlobalKey();
        final GlobalKey<AppExpansionTileState> expansionTile2 = GlobalKey();
        final GlobalKey<AppExpansionTileState> expansionTile3 = GlobalKey();

        return Scaffold(
          // backgroundColor: CustomeColors.basicYellow,
          body: Container(
            color: CustomeColors.basicYellow,
            height: Get.height,
            child: SingleChildScrollView(
              child: Form(
                key: salesKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppExpansionTile(
                      key:expansionTile ,
                      initiallyExpanded: isCustomer,
                      title: Text( custName == null ? 'Customer Name' : '$custName',
                        style:
                        TextStyle(color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                      // controlAffinity: ListTileControlAffinity.trailing,
                      // collapsedIconColor: CustomeColors.basicTextColorGreen,
                      children: List.generate(
                        items.length,
                            (index) {
                          CustomerDetail data = items[index];

                          return ListTile(
                            leading: Text(data.custName),
                            onTap: () {
                              custName=data.custName.toString();
                               custId = data.id.toString();
                              logger.i(data.custName);
                              isCustomer=false;
                              expansionTile.currentState!.collapse();
                              setState((){});
                            },
                          );
                        },
                      ),

                    ),
                    AppExpansionTile(
                      key: expansionTile2,
                      title: Text(
                        companyName == null
                            ? 'Company Name'
                            : '${companyName} ${stock}',
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                      // controlAffinity: ListTileControlAffinity.trailing,
                      // collapsedIconColor: CustomeColors.basicTextColorGreen,
                      children: List.generate(
                        AvailableStock.length,
                        (index) {
                          PurchaserDetail data = AvailableStock[index];

                          return ListTile(
                            leading: Text(
                                "${data.companyName}   ${data.pricePerKg}    ${data.remainingQuantity}"),
                            onTap: () {
                              companyName = data.companyName.toString();

                              pFid = data.id.toString();
                              stock = data.remainingQuantity.toString();
                              productTypeId = data.productTypeId.toString();
                              remainStock = (int.parse(data.remainingQuantity) -
                                      int.parse(_Quantity!.text == ''
                                          ? '0'
                                          : _Quantity!.text))
                                  .toString();
                              logger.i(remainStock);

                              setState(() {});
                            },
                          );
                        },
                      ),

                    ),
                   Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 50),
                      child: Text(
                        'Quantity (packs)',
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InputFormField(
                      keyboardType: TextInputType.number,
                      inputformatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(22),
                      ],
                      textEditingController: _Quantity,
                      onChange: (String value) {
                        salesKey.currentState!.validate();
                        logger.i(_Quantity!.text);
                        logger.e(remainStock);
                        _total = TextEditingController(
                            text: ((int.parse(_Quantity!.text) *
                                    int.parse(_PricePerKg!.text == ''
                                        ? '0'
                                        : _PricePerKg!.text))
                                .toString()));
                        remainStock = (int.parse(stock == null ? '0' : stock!) -
                                int.parse(_Quantity!.text == ''
                                    ? '0'
                                    : _Quantity!.text))
                            .toString();
                        logger.i(remainStock);
                        //   logger.i(_total.toString());
                      },
                      validator: (value) {
                        if (value.isEmpty) return "Empty Value";
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Price (Rs/pack)',
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InputFormField(
                      keyboardType: TextInputType.number,
                      inputformatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10),
                      ],
                      textEditingController: _PricePerKg,
                      onChange: (String value) {
                        salesKey.currentState!.validate();
                        setState(() {
                          _total = TextEditingController(
                              text: ((int.parse(_Quantity!.text) *
                                      int.parse(_PricePerKg!.text))
                                  .toString()));

                          //   logger.i(_total.toString());
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) return "Empty Value";
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Total Amount',
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InputFormField(
                      readOnly: true,
                      inputformatter: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(13),
                      ],
                      textEditingController: _total,
                      onChange: (String value) {
                        salesKey.currentState!.validate();
                        setState(() {
                          logger.i(_total.toString());
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) return "Empty Value";

                        return null;
                      },
                    ),

                    // AppExpansionTile(
                    //   key: expansionTile3,
                    //   title: Text(
                    //     'Sale Amount Status',
                    //     style: TextStyle(
                    //         color: CustomeColors.basicTextColorGreen,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    //   // controlAffinity: ListTileControlAffinity.trailing,
                    //   // collapsedIconColor: CustomeColors.basicTextColorGreen,
                    //   children: List.generate(
                    //     statusType.length,
                    //     (index) {
                    //       return ListTile(
                    //         leading: Text("${statusType[index]}"),
                    //         onTap: () {
                    //           status = index.toString();
                    //
                    //           if (int.parse(status) == 0) {
                    //             _paidAmount = _total;
                    //           } else {
                    //             _paidAmount = TextEditingController(text: '0');
                    //           }
                    //           setState(() {});
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    // InputFormField(
                    //   readOnly: status == '1' ? false : true,
                    //   inputformatter: <TextInputFormatter>[
                    //     LengthLimitingTextInputFormatter(13),
                    //   ],
                    //   textEditingController: _paidAmount,
                    //   onChange: (String value) {
                    //     salesKey.currentState!.validate();
                    //     setState(() {
                    //       logger.i(_paidAmount!.text);
                    //     });
                    //   },
                    //   validator: (value) {
                    //     if (value.isEmpty) return "Empty Value";
                    //
                    //     return null;
                    //   },
                    // ),

                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        widget.salesData == null ? 'Creation Date': 'Updated date'
                        ,
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TableCalendar(
                      initialSelectedDay:
                          widget.salesData == null ? DateTime.now() : dateTime,
                      calendarController: _controller,
                    ),
                    CustomeButton( widget.salesData == null
                        ? "Add Sales"
                        : "Edit Sales", () {  _dueDate = (_controller?.focusedDay).toString();

                    if (salesKey.currentState!.validate()) {
                      var user_idfk = userlist[1];
                      var total = _total!.text,
                          quantity = _Quantity!.text,
                          priceperkg = _PricePerKg!.text;




                      if(int.parse(remainStock!)<0){

                        TOASTS('Not Enough Quantity Available');

                      }
                      else
                      {
                        if (widget.salesData == null) {
                          String body =
                              "?&user_idfk=$user_idfk"
                              "&CusFid=$custId"
                              "&Quantity=$quantity"
                              "&PricePerKg=$priceperkg"
                              "&productTypeId=$productTypeId"
                              "&total=$total"
                              "&creationDate=$_dueDate"
                              "&stock=$stock"
                              "&remainStock=$remainStock"
                              "&pFid=$pFid";

                          logger.i(body);
                          ApiService.addNewSales(body);
                        } else {
                          var id = widget.salesData!.id;
                          String body = "?id=$id"
                              "&user_idfk=$user_idfk"
                              "&CusFid=$custId"
                              "&Quantity=$quantity"
                              "&PricePerKg=$priceperkg"
                              "&productTypeId=$productTypeId"
                              "&total=$total"
                              "&updateDate=$_dueDate"
                              "&stock=$stock"
                              "&remainStock=$remainStock"
                              "&pFid=$pFid";
                          logger.i(body);
                          //    ApiService.updateSales(body);
                        }
                      }
                      // goto(data.setScreenIndex(3), isPrevClose: true);
                      data.setScreenIndex(3);
                    }}),

                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void getData() {
    userlist = UserSharedPreferences.getLoginDetail();
    var user_idfk = userlist[1];
    logger.i(user_idfk);
    String body = "?user_idfk=$user_idfk";
    ApiService.getCustomerDetails(body);
    ApiService.getPurchaseDetails(body);
  }
}
