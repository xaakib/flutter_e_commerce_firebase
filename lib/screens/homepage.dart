import 'package:flutter/material.dart';

import '../constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "HomeScreen",
            style: Constants.regulerheading,
          ),
        ),
      ),
    );
  }
}
