import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "HomeScreen",
                style: Constants.regulerheading,
              ),
              FlatButton(onPressed: () {
                FirebaseAuth.instance.signOut();
              }, child: Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
