import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_btn.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_input.dart';

import '../constant.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  //build an aler dialog to display some error`s
  Future<void> _alerDialogbuilder() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Container(
            child: Text("Just some random text for now"),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close Dialog"),
            ),
          ],
        );
      },
    );
  }

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
                     _alerDialogbuilder();
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
