import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../controllers/user_provider/user_provider.dart';
import '../../services/api_services.dart';
import '../../utls/utls.dart';
import '../AppExpenpsionTile.dart';
import '../pojjo/appBar.dart';
import '../pojjo/colors.dart';
import '../pojjo/customeButton.dart';
import '../pojjo/inputFormField.dart';

class PurchasePayment extends StatefulWidget {
  String pFid;
  String remainingAmount;

  PurchasePayment(this.pFid,this.remainingAmount);

  @override
  State<PurchasePayment> createState() => _PurchasePaymentState();
}

class _PurchasePaymentState extends State<PurchasePayment> {
  final paymentKey = GlobalKey<FormState>();

  TextEditingController? _payment;

  @override
  void initState() {
    super.initState();
    _payment=TextEditingController();
  }
  void dispose() {
    super.dispose();
    _payment!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<UserProvider>(builder: (context, data, child) {
        final GlobalKey<AppExpansionTileState> productTypes = GlobalKey();
        final GlobalKey<AppExpansionTileState> selectedCompanyName =
            GlobalKey();
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: CustomeAppBar(() {
              // Navigator.of(context).pop();
              Get.back();
            },title: "Add Payment",
            ),
          ),
          body: Container(
            color: CustomeColors.basicYellow,
            height: Get.height,
            child: SingleChildScrollView(
              child: Form(
                key: paymentKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 50),
                  child: Text(
                    'Remaining Amount',
                    style: TextStyle(
                        color: CustomeColors.basicTextColorGreen,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.only(right: 15.0, top: 50),
                  child: Text(
                    widget.remainingAmount,
                    style: TextStyle(
                        color: CustomeColors.basicTextColorGreen,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                ],),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 20),
                      child: Text(
                        'Enter Amount',
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
                      textEditingController: _payment,
                      onChange: (String value) {
                        paymentKey.currentState!.validate();
                        setState(() {

                     logger.i(_payment!.text);
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) return "Empty Value";
                        return null;
                      },
                    ),

                    CustomeButton(
                         "Add Payment",
                            () {

                              String pFid=widget.pFid;
                      var date=new DateTime.now().toString();
                      String payment =_payment!.text;
                              String remainingAmount=widget.remainingAmount;

                                  if (paymentKey.currentState!.validate()) {
                                    if (widget.pFid != '' &&  payment!= '' && date!='' ) {
                                      String body = "?pFid=$pFid"
                                          "&amount=$payment"
                                          "&remainingAmount=$remainingAmount"
                                          "&date=$date";

                                      logger.i(body);
                                      ApiService.addNewPaymentToPurchase(body);

                                    }
                                    else
                                    {

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
}
