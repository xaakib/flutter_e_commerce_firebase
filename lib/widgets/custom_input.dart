import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/constant.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function(String) onSubmit;
  final Function(String) onChanged;
  final TextInputAction textinputAction;
  final FocusNode focusNode;
  final bool isPasswordField;

  const CustomInput(
      {Key key,
      this.isPasswordField,
      this.focusNode,
      this.onChanged,
      this.onSubmit,
      this.hintText,
      this.textinputAction});
  @override
  Widget build(BuildContext context) {
bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
        textInputAction: textinputAction,
        focusNode: focusNode,
        onChanged: onChanged,
        obscureText: _isPasswordField,
        onSubmitted: onSubmit,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? "Hint Text",
            contentPadding:
                EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0)),
        style: Constants.regulerDarkText,
      ),
    );
  }
}
