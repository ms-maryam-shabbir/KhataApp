import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/services/jsonResponsesModel/customer_response_model/get_all_cutomer_response.dart';
import 'package:practice/views/company/CompanyDetail.dart';
import 'package:practice/views/company/all_companies.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../controllers/map_provider/map_provider.dart';
import '../../utls/user_shared_preferences.dart';
import '../../utls/utls.dart';
import '../pojjo/colors.dart';
import '../pojjo/inputFormField.dart';
import 'all_customers.dart';

class AddNewCustomer extends StatefulWidget {
  CustomerDetail? customerData;

  AddNewCustomer({this.customerData});

  @override
  State<AddNewCustomer> createState() => _AddNewCustomerState();
}

class _AddNewCustomerState extends State<AddNewCustomer> {
  final customerKey = GlobalKey<FormState>();

  CalendarController? _controller;
  TextEditingController? _customerName;
  TextEditingController? _customerArea;
  TextEditingController? _customerNumber;
  TextEditingController? _customerStatus;
  String? _joiningDate;
  List<dynamic> userlist = [];
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.parse(widget.customerData == null
        ? DateTime.now().toString()
        : widget.customerData!.joiningDate);

    _customerName = TextEditingController(
        text: widget.customerData == null ? '' : widget.customerData!.custName);
    _customerArea = TextEditingController(
        text: widget.customerData == null ? '' : widget.customerData!.custArea);
    _customerNumber = TextEditingController(
        text:
            widget.customerData == null ? '' : widget.customerData!.custNumber);
    _customerStatus = TextEditingController(
        text:
            widget.customerData == null ? '' : widget.customerData!.custstatus);

    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _customerName!.dispose();
    _customerArea!.dispose();

    _customerNumber!.dispose();
    _customerStatus!.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context,data,child) {
        return SafeArea(
          child: Scaffold(
            // backgroundColor: CustomeColors.basicYellow,

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
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 50),
                        child: Text(
                          'Cutomer Name',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InputFormField(
                        inputformatter: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(22),
                        ],
                        textEditingController: _customerName,
                        onChange: (String value) {
                          customerKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value.isEmpty) return "Empty Value";
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Customer Area/Location',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InputFormField(
                        inputformatter: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(30),
                        ],
                        textEditingController: _customerArea,
                        onChange: (String value) {
                          customerKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value.isEmpty) return "Empty Value";
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Contact Number',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InputFormField(
                        inputformatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(13),
                        ],
                        keyboardType: TextInputType.number,
                        textEditingController: _customerNumber,
                        onChange: (String value) {
                          customerKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value.isEmpty) return "Empty Value";

                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Customer Status',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InputFormField(
                        inputformatter: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(20),
                        ],
                        textEditingController: _customerStatus,
                        onChange: (String value) {
                          customerKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value.isEmpty) return "Empty Value";
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Joining Date',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TableCalendar(
                        initialSelectedDay:
                            widget.customerData == null ? DateTime.now() : dateTime,
                        calendarController: _controller,
                      ),
                      Container(
                        width: Get.width,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: CustomeColors.basicTextColorGreen,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomeColors.basictransparent,
                              shadowColor: CustomeColors.basictransparent,
                              onPrimary: CustomeColors.basictransparent,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () async {
                              _joiningDate = (_controller?.focusedDay).toString();
                              if (customerKey.currentState!.validate()) {
                                userlist = UserSharedPreferences.getLoginDetail();
                                var user_idfk = userlist[1];
                                var name = _customerName!.text,
                                    area = _customerArea!.text,
                                    number = _customerNumber!.text,
                                    status = _customerStatus!.text;

                                if (widget.customerData == null) {
                                  String body = "?&user_idfk=$user_idfk"
                                      "&CustName=$name"
                                      "&CustArea=$area"
                                      "&Custstatus=$number"
                                      "&CustNumber=$status"
                                      "&JoiningDate=$_joiningDate";
                                  logger.i(body);
                                  ApiService.addNewCustomer(body);
                                } else {
                                  var id = widget.customerData!.id;
                                  String body = "?id=$id&user_idfk=$user_idfk"
                                      "&CustName=$name"
                                      "&CustArea=$area"
                                      "&Custstatus=$number"
                                      "&CustNumber=$status"
                                      "&JoiningDate=$_joiningDate";
                                  logger.i(body);
                                  ApiService.updateCustomer(body);
                                }
                                data.setScreenIndex(1);
                              }
                            },
                            child: Text(
                              widget.customerData == null
                                  ? "Add Customer"
                                  : "Edit Customer",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomeColors.basicbuttonTextColorWhite),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
