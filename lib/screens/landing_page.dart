import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/constant.dart';
import 'package:flutter_e_commerce_firebase/screens/homepage.dart';
import 'package:flutter_e_commerce_firebase/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //if has error ?? then showing error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          //streambuilder can check the login state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamsnapshot) {
              //if has error ?? then showing error
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamsnapshot.error}"),
                  ),
                );
              }
              //Connection state active - Do the user login check inside the
              //if statement
              if (streamsnapshot.connectionState == ConnectionState.active) {
                User _user = streamsnapshot.data;
                if (_user == null) {
                  //user not logged in ,  head to login
                  return LoginPage();
                } else {
                  //user is logged in , head to homepage
                  return HomeScreen();
                }
              }
            },
          );
        }

        //connection to firebase in loading...
        return Scaffold(
          body: Center(
            child: Text(
              "checking authentication...",
              style: Constants.regulerheading,
            ),
          ),
        );
      },
    );
  }
}
