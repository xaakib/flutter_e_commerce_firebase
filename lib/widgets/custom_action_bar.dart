import 'package:flutter/material.dart';

import '../constant.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrrow;
  final bool hasTitle;
  final bool hasBackground;
  CustomActionBar(
      {this.title, this.hasBackArrrow, this.hasTitle, this.hasBackground});
  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrrow ?? false;
    bool _hasTitle = hasTitle ?? true;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
        top: 56.0,
        left: 24.0,
        right: 24.0,
        bottom: 42.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            GestureDetector(
              onTap: () {
                // Navigator.pop(context);
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
              child: Text(
                "0",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
