import 'package:flutter/material.dart';

import '../constant.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTile;

  const CustomActionBar({this.title, this.hasBackArrow, this.hasTile});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 56.0, left: 24, right: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Action Bar",
            style: Constants.boldheading,
          ),
          Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black),
              child: Center(
                child: Text(
                  "0",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
