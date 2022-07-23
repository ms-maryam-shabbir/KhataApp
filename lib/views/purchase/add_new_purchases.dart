import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/services/jsonResponsesModel/get_all_company_details_response.dart';
import 'package:practice/views/pojjo/customeButton.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../services/jsonResponsesModel/purchase_response/get_purchase_response.dart';
import '../../services/jsonResponsesModel/purchase_response/purchase_on_credit_response.dart';
import '../../utls/user_shared_preferences.dart';
import '../../utls/utls.dart';
import '../AppExpenpsionTile.dart';
import '../pojjo/colors.dart';
import '../pojjo/inputFormField.dart';

class AddNewPurchase extends StatefulWidget {
  PurchaserDetail? purchaseData;
  PurchaseOnCreditDetail? purchaseOnCreditDetailData;

  AddNewPurchase({this.purchaseData, this.purchaseOnCreditDetailData});

  @override
  State<AddNewPurchase> createState() => _AddNewPurchaseState();
}

class _AddNewPurchaseState extends State<AddNewPurchase> {
  final customerKey = GlobalKey<FormState>();
  String paidAmount = '0';
  String status = '2';
  var total = 0;
  var productName;
  CalendarController? _controller;
  TextEditingController? _Quantity;
  TextEditingController? _PricePerKg;
  TextEditingController? _status;
  TextEditingController? _total;
  TextEditingController? _paidAmount;
  String? _completeDate;
  String? _dueDate;
  List<dynamic> userlist = [];
  DateTime? dateTime;
  String selectedValue = "USA";
  String? companyname;
  String? productTypeId;

  List<CompanyDetail> items = [];
  List<String> statusType = ['Fully Paid', 'Half Paid', 'Not Paid'];
  List<String> productType = [
    'Fine 80Kg',
    'Fine 50Kg',
    'Maida 80Kg',
    'Maida 50Kg',
    'Atta 79Kg',
    'Atta 20Kg',
    'Atta 15Kg',
    'Atta 10Kg '
  ];
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    getData();
    _controller = CalendarController();
    getPurchaseData(
        purchaseData: widget.purchaseData,
        purchaseOnCreditDetailData: widget.purchaseOnCreditDetailData);
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
        if (data.isCompanyDetailsResponseLoaded) {
          items = data.getCompanyDetailsResponse!.companyDetails;
          // logger.i(data.getPurchaseResponse!.purchaserDetails[3].);
        } else {
          logger.i('hhhhhhhhhhhhhhhhhhhhhh');
        }

        final GlobalKey<AppExpansionTileState> productTypes = GlobalKey();
        final GlobalKey<AppExpansionTileState> selectedCompanyName =
            GlobalKey();
        return Scaffold(
          body: Container(
            color: CustomeColors.basicYellow,
            height: Get.height,
            child: SingleChildScrollView(
              child: Form(
                key: customerKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppExpansionTile(
                      key: productTypes,
                      title: Text(
                        productTypeId == '' || productTypeId==null
                            ? 'Select ProductType'
                            : productType[int.parse(productTypeId!)],
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),

                      // controlAffinity: ListTileControlAffinity.trailing,
                      // collapsedIconColor: CustomeColors.basicTextColorGreen,
                      children: List.generate(
                        productType.length,
                        (index) {
                          return ListTile(
                            leading: Text("${productType[index]}"),
                            onTap: () {
                              productTypeId = index.toString();

                              setState(() {});
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 10),
                      child: Text(
                        'Quantity (pack)',
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
                        customerKey.currentState!.validate();
if(value.isEmpty)return;
                          _total = TextEditingController(
                              text: ((int.parse(_Quantity!.text) *
                                      int.parse(_PricePerKg!.text))
                                  .toString()));

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
                        'Price (Rs/Pack)',
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
                        customerKey.currentState!.validate();
                        if(value.isEmpty)return;
                          _total = TextEditingController(
                              text: ((int.parse(_Quantity!.text) *
                                      int.parse(_PricePerKg!.text))
                                  .toString()));

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
                        'Total',
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(''),
                    InputFormField(
                      readOnly: true,
                      inputformatter: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(13),
                      ],
                      textEditingController: _total,
                      onChange: (String value) {
                        customerKey.currentState!.validate();
                        setState(() {
                          logger.i(_total.toString());
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) return "Empty Value";

                        return null;
                      },
                    ),

                    // ExpansionTile(
                    //   title: Text(
                    //     'Purchase Status',
                    //     style:
                    //         TextStyle(color: CustomeColors.basicTextColorGreen),
                    //   ),
                    //   controlAffinity: ListTileControlAffinity.trailing,
                    //   collapsedIconColor: CustomeColors.basicTextColorGreen,
                    //   children: List.generate(
                    //     statusType.length,
                    //     (index) {
                    //       return ListTile(
                    //         leading: Text("${statusType[index]}"),
                    //         onTap: () {
                    //           status = index.toString();
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
                    //
                    // Padding(
                    //   padding: EdgeInsets.only(left: 15.0),
                    //   child: Text(
                    //     'Amount paid',
                    //     style: TextStyle(
                    //         color: CustomeColors.basicTextColorGreen,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),

                    // InputFormField(
                    //   readOnly: int.parse(status) == 1 ? false : true,
                    //   inputformatter: <TextInputFormatter>[
                    //     LengthLimitingTextInputFormatter(13),
                    //   ],
                    //   textEditingController: _paidAmount,
                    //   onChange: (String value) {
                    //     customerKey.currentState!.validate();
                    //     setState(() {
                    //
                    //     });
                    //   },
                    //   validator: (value) {
                    //     if (value.isEmpty) return "Empty Value";
                    //
                    //     return null;
                    //   },
                    // ),
                    AppExpansionTile(
                      key: selectedCompanyName,
                      title: Text(
                        'Company Name',
                        style: TextStyle(
                          color: CustomeColors.basicTextColorGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // controlAffinity: ListTileControlAffinity.trailing,
                      // collapsedIconColor: CustomeColors.basicTextColorGreen,
                      children: List.generate(
                        items.length,
                        (index) {
                          CompanyDetail data = items[index];

                          return ListTile(
                            leading: Text(
                                "${data.companyName} ( ${data.compOwenerName} )"),
                            onTap: () {

                              companyname = data.id.toString();
                              logger.i(data.id);
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        widget.purchaseData == null &&
                                widget.purchaseOnCreditDetailData == null
                            ? 'Creation Date'
                            : 'Updated Date',
                        style: TextStyle(
                            color: CustomeColors.basicTextColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TableCalendar(
                      initialSelectedDay: widget.purchaseData == null &&
                              widget.purchaseOnCreditDetailData == null
                          ? DateTime.now()
                          : dateTime,
                      calendarController: _controller,
                    ),
                    CustomeButton(
                        widget.purchaseData == null &&
                                widget.purchaseOnCreditDetailData == null
                            ? "Add Purchase"
                            : "Edit Purchase", () {
                      _dueDate = (_controller?.focusedDay).toString();
                      if (customerKey.currentState!.validate()) {
                        var user_idfk = userlist[1];
                        var total = _total!.text,
                            quantity = _Quantity!.text,
                            paidAmount = _paidAmount!.text,
                            priceperkg = _PricePerKg!.text;

                        var remainingAmount;
                        if (status == '0') {
                          remainingAmount = '0';
                        } else if (status == '1') {
                          remainingAmount =
                              (int.parse(total) - int.parse(paidAmount))
                                  .toString();
                        } else {
                          paidAmount = '0';
                          remainingAmount = total;
                        }
                        if (widget.purchaseData == null && widget.purchaseOnCreditDetailData == null) {
                          if (companyname == '') {
                          } else {
                            String body = "?&user_idfk=$user_idfk"
                                "&ComFid=$companyname"
                                "&productTypeId=$productTypeId"
                                "&totalQuantity=$quantity"
                                "&remainingQuantity=$quantity"
                                "&PricePerKg=$priceperkg"
                                "&total=$total"
                                "&creationDate=$_dueDate"
                                "&updatedDate=$_dueDate";

                            logger.i(body);
                            // ApiService.addNewPurchase(body);
                            data.setScreenIndex(8);
                          }
                        }
                        else {
                          var id = widget.purchaseData != null
                              ? widget.purchaseData!.id
                              : widget.purchaseOnCreditDetailData!.id;
                          String body = "?id=$id"
                              "?&user_idfk=$user_idfk"
                              "&ComFid=$companyname"
                              "&productTypeId=$productTypeId"
                              "&totalQuantity=$quantity"
                              "&PricePerKg=$priceperkg"
                              "&total=$total"
                              "&updatedDate=$_dueDate";

                          logger.i(body);
                          ApiService.updatePurchase(body);
                          widget.purchaseOnCreditDetailData != null
                              ?
                              // goto(PurchaseOnCredit())

                              data.setScreenIndex(9)
                              : data.setScreenIndex(8);
                        }
                      }
                    }),

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
    String body = "?user_idfk=$user_idfk";
    ApiService.getCompanyDetails(body);
  }

  void getPurchaseData(
      {PurchaserDetail? purchaseData,
      PurchaseOnCreditDetail? purchaseOnCreditDetailData}) {
    if (purchaseData == null) {
      dateTime = DateTime.parse(widget.purchaseOnCreditDetailData == null
          ? DateTime.now().toString()
          : widget.purchaseOnCreditDetailData!.creationDate);

      _Quantity = TextEditingController(
          text: widget.purchaseOnCreditDetailData == null
              ? ''
              : widget.purchaseOnCreditDetailData!.totalQuantity);
      _PricePerKg = TextEditingController(
          text: widget.purchaseOnCreditDetailData == null
              ? ''
              : widget.purchaseOnCreditDetailData!.pricePerKg);
      _status = TextEditingController(
          text: widget.purchaseOnCreditDetailData == null
              ? ''
              : widget.purchaseOnCreditDetailData!.status);
      _total = TextEditingController(
          text: widget.purchaseOnCreditDetailData == null
              ? ''
              : widget.purchaseOnCreditDetailData!.total);
      _paidAmount = TextEditingController(
          text: widget.purchaseOnCreditDetailData == null
              ? ''
              : widget.purchaseOnCreditDetailData!.paidAmount);
      status = widget.purchaseOnCreditDetailData == null
          ? '0'
          : widget.purchaseOnCreditDetailData!.status;
      productTypeId = widget.purchaseOnCreditDetailData == null
          ? ''
          : widget.purchaseOnCreditDetailData!.productTypeId;
      companyname = widget.purchaseOnCreditDetailData == null
          ? ''
          : widget.purchaseOnCreditDetailData!.comFid;
    } else {
      dateTime = DateTime.parse(widget.purchaseData == null
          ? DateTime.now().toString()
          : widget.purchaseData!.creationDate);

      _Quantity = TextEditingController(
          text: widget.purchaseData == null
              ? ''
              : widget.purchaseData!.totalQuantity);
      _PricePerKg = TextEditingController(
          text: widget.purchaseData == null
              ? ''
              : widget.purchaseData!.pricePerKg);
      _status = TextEditingController(
          text: widget.purchaseData == null ? '' : widget.purchaseData!.status);
      _total = TextEditingController(
          text: widget.purchaseData == null ? '' : widget.purchaseData!.total);
      _paidAmount = TextEditingController(
          text: widget.purchaseData == null
              ? ''
              : widget.purchaseData!.paidAmount);
      status = widget.purchaseData == null ? '0' : widget.purchaseData!.status;
      productTypeId =
          widget.purchaseData == null ? '' : widget.purchaseData!.productTypeId;
      companyname =
          widget.purchaseData == null ? '' : widget.purchaseData!.comFid;
    }
  }
}
