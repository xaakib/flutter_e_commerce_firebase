import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/constant.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_btn.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    "Welcome User, \n login to your acount",
                    textAlign: TextAlign.center,
                    style: Constants.boldheading,
                  ),
                ),
                Text("Inpute Feild"),
                CustomBtn(),
              ],
            )),
      ),
    );
  }
}
