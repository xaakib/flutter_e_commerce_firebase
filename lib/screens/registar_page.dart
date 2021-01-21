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
      barrierDismissible: false,
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

// default form loading state
  bool _registarFormLoading = false;

  // form input Field Values
  String _registarEmail = "";
  String _registarPassword = "";

  // Foucs Node for input fields

  FocusNode _passwordFocuseNodel;

  @override
  void initState() {
    _passwordFocuseNodel = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocuseNodel = FocusNode();
    super.dispose();
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
                    textinputAction: TextInputAction.next,
                    onChanged: (value) {
                      _registarEmail = value;
                    },
                    hintText: "Email",
                    onSubmit: (value){
                      _passwordFocuseNodel.requestFocus();
                    },
                  ),
                  CustomInput(
                    onChanged: (value) {
                      _registarPassword = value;
                    },
                    isPasswordField: true,
                    hintText: "Password",
                    focusNode: _passwordFocuseNodel,
                  ),
                  CustomBtn(
                    text: "Create New Account",
                    onPressed: () {
                      setState(() {
                        _registarFormLoading = true;
                      });
                    },
                    isLoading: _registarFormLoading,
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
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
