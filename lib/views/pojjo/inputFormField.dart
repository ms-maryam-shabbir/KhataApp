import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class InputFormField extends StatefulWidget {
  Widget? suffIcon;
  bool obscure=false;
  var onChange;
  var validator;
  var keyboardType;
  var textEditingController;
  var inputformatter,readOnly;
InputFormField({this.suffIcon, this.obscure=false, this.onChange, this.validator, this.keyboardType, this.textEditingController,this.inputformatter, this.readOnly=false}) ;


  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: widget.inputformatter,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: widget.onChange,
          readOnly:widget.readOnly,
        decoration: InputDecoration(

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),

            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              )),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          suffixIcon:widget.suffIcon,
        ),
        obscureText: widget.obscure,
        // controller: textEditingController,
      ),
    );
  }
}
