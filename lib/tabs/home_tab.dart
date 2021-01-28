import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_action_bar.dart';

import '../constant.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
              child: Text(
            "HomePage",
            style: Constants.regulerheading,
          )),
          CustomActionBar(
            hasBackArrrow: false,
            hasTitle: true,
            title: "Action Bar",
          ),
        ],
      ),
    );
  }
}
