import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/api_services.dart';
import 'package:practice/views/company/CompanyDetail.dart';
import 'package:practice/views/company/all_companies.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../controllers/map_provider/map_provider.dart';
import '../../utls/user_shared_preferences.dart';
import '../../utls/utls.dart';
import '../pojjo/colors.dart';
import '../pojjo/inputFormField.dart';

class AddNewCompany extends StatefulWidget {
  var companyData;

  AddNewCompany({this.companyData});

  @override
  State<AddNewCompany> createState() => _AddNewCompanyState();
}

class _AddNewCompanyState extends State<AddNewCompany> {
  final companyKey = GlobalKey<FormState>();

  CalendarController? _controller;
  TextEditingController? _companyName;
  TextEditingController? _companyArea;
  TextEditingController? _companyNumber;
  TextEditingController? _companyOwenerName;
  TextEditingController? _companyStatus;
  String? _joiningDate;
  List<dynamic> userlist = [];
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.parse(widget.companyData == null
        ? DateTime.now().toString()
        : widget.companyData.joiningDate);

    _companyName = TextEditingController(
        text: widget.companyData == null ? '' : widget.companyData.companyName);
    _companyArea = TextEditingController(
        text: widget.companyData == null ? '' : widget.companyData.companyArea);
    _companyNumber = TextEditingController(
        text: widget.companyData == null ? '' : widget.companyData.number);
    _companyOwenerName = TextEditingController(
        text: widget.companyData == null
            ? ''
            : widget.companyData.compOwenerName);
    _companyStatus = TextEditingController(
        text:
            widget.companyData == null ? '' : widget.companyData.companyStatus);

    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _companyName!.dispose();
    _companyArea!.dispose();
    _companyOwenerName!.dispose();
    _companyNumber!.dispose();
    _companyStatus!.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, data,child) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: CustomeColors.basicYellow,
              height: Get.height,
              child: SingleChildScrollView(
                child: Form(
                  key: companyKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 50),
                        child: Text(
                          'Company Name',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InputFormField(
                        inputformatter: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(22),
                        ],
                        textEditingController: _companyName,
                        onChange: (String value) {
                          companyKey.currentState!.validate();

                        },
                        validator: (value) {
                          if (value.isEmpty) return "Empty Value";
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Company Area/Location',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InputFormField(
                        inputformatter: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(30),
                        ],
                        textEditingController: _companyArea,
                        onChange: (String value) {
                          companyKey.currentState!.validate();

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
                        textEditingController: _companyNumber,
                        onChange: (String value) {
                          companyKey.currentState!.validate();

                        },
                        validator: (value) {
                          if (value.isEmpty) return "Empty Value";

                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Company Status',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InputFormField(
                        inputformatter: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(20),
                        ],
                        textEditingController: _companyStatus,
                        onChange: (String value) {
                          companyKey.currentState!.validate();

                        },
                        validator: (value) {
                          if (value.isEmpty) return "Empty Value";
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Dealer Name',
                          style: TextStyle(
                              color: CustomeColors.basicTextColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InputFormField(
                        inputformatter: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(20),
                        ],
                        textEditingController: _companyOwenerName,
                        onChange: (String value) {
                          companyKey.currentState!.validate();

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
                            widget.companyData == null ? DateTime.now() : dateTime,
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
                              if (companyKey.currentState!.validate()) {
                                userlist = UserSharedPreferences.getLoginDetail();
                                var user_idfk = userlist[1];
                                var name = _companyName!.text,
                                    area = _companyArea!.text,
                                    number = _companyNumber!.text,
                                    status = _companyStatus!.text,
                                    ownername = _companyOwenerName!.text;

                                if (widget.companyData == null) {
                                  String body = "?&user_idfk=$user_idfk"
                                      "&CompanyName=$name"
                                      "&CompanyArea=$area"
                                      "&number=$number"
                                      "&CompanyStatus=$status"
                                      "&CompOwenerName=$ownername"
                                      "&JoiningDate=$_joiningDate";
                                  logger.i(body);
                                  ApiService.addNewCompany(body);
                                } else {
                                  var id = widget.companyData.id;
                                  String body = "?id=$id&user_idfk=$user_idfk"
                                      "&CompanyName=$name"
                                      "&CompanyArea=$area"
                                      "&number=$number"
                                      "&CompanyStatus=$status"
                                      "&CompOwenerName=$ownername"
                                      "&JoiningDate=$_joiningDate";
                                  logger.i(body);
                                  ApiService.updateCompany(body);
                                }
                                data.setScreenIndex(0);
                              }
                            },
                            child: Text(
                              widget.companyData == null
                                  ? "Add Company"
                                  : "Edit Company",
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
