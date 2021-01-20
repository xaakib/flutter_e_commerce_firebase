import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_btn.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_input.dart';

import '../constant.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  "Create a new account",
                  textAlign: TextAlign.center,
                  style: Constants.boldheading,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email",
                  ),
                  CustomInput(
                    hintText: "Password",
                  ),
                  CustomBtn(
                    text: "Create New Account",
                    onPressed: () {
                      print("Clicked the Login Button Click");
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomBtn(
                  text: "Back To Login",
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  outLineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}