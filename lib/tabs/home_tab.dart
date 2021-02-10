import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/constant.dart';
import 'package:flutter_e_commerce_firebase/homescreen_widget/product_widgets.dart';
import 'package:flutter_e_commerce_firebase/screens/product_page.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_action_bar.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Products");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _productsRef.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                // Collection Data ready to display
                if (snapshot.connectionState == ConnectionState.done) {
                  // Display the data inside a list view
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 60.0,
                      bottom: 12.0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: snapshot.data.docs.map((document) {
                                  return ProductOne(
                                    imageUrl: document.data()['images'][0],
                                    name: document.data()['name'],
                                    price: document.data()['price'].toString(),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // Loading State
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            CustomActionBar(
              title: "Home",
              hasBackArrrow: false,
            ),
          ],
        ),
      ),
    );
  }
}
