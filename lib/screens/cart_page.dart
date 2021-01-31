import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/services/firebase_serviecs.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_action_bar.dart';
import 'product_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

FirebaseServies _firebaseServies = FirebaseServies();

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firebaseServies.userRef
                .doc(_firebaseServies.getUserId())
                .collection("Cart")
                .get(),
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
                    top: 70.0,
                    bottom: 12.0,
                  ),
                  child: ListView(
                    children: snapshot.data.docs.map((document) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                        productId: document.id,
                                      )));
                        },
                        child: FutureBuilder(
                          future: _firebaseServies.productsRef
                              .doc(document.id)
                              .get(),
                          builder: (context, productSnap) {
                            if (productSnap.hasError) {
                              return Container(
                                child: Text("${productSnap.error}"),
                              );
                            }
                            if (productSnap.connectionState ==
                                ConnectionState.done) {
                              Map _productMap = productSnap.data.data();
                              return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Container(
                                    child: Text(" ${_productMap['name']}"),
                                  ));
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      );
                    }).toList(),
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
            hasBackArrrow: true,
            title: "Cart",
          ),
        ],
      ),
    );
  }
}
