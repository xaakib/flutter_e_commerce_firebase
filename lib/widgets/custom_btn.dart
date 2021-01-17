import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Text(
        "Create New Account",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
