import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/constant.dart';

class CustomInput extends StatelessWidget {
  final String hintText;

  const CustomInput({Key key, this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
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
