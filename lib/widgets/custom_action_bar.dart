import 'package:flutter/material.dart';

import '../constant.dart';

class CustomActionBar extends StatelessWidget {
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
          Text("0"),
        ],
      ),
    );
  }
}
