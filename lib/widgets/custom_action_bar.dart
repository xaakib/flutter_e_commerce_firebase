import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrrow;
  final bool hasTitle;
  final bool hasBackground;
  CustomActionBar(
      {this.title, this.hasBackArrrow, this.hasTitle, this.hasBackground});

  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection("Users");

  User _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrrow ?? false;
    bool _hasTitle = hasTitle ?? true;

    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/images/back_arrow.png"),
                  color: Colors.white,
                  width: 16.0,
                  height: 16.0,
                ),
              ),
            ),
          if (_hasTitle)
            Text(
              title ?? "Action Bar",
              style: Constants.boldheading,
            ),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) => CartPage(),
              // ));
            },
            child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: StreamBuilder(
                    stream:
                        _usersRef.doc(_user.uid).collection("Cart").snapshots(),
                    builder: (context, snapshot) {
                      int __totalItems = 0;

                      if (snapshot.connectionState == ConnectionState.active) {
                        List _document = snapshot.data.docs;
                        __totalItems = _document.length;
                      }
                      return Text(
                        "$__totalItems" ?? "0",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      );
                    })),
          )
        ],
      ),
    );
  }
}
