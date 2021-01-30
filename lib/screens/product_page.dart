import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_action_bar.dart';
import 'package:flutter_e_commerce_firebase/widgets/image_sweep.dart';
import 'package:flutter_e_commerce_firebase/widgets/product_size.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  const ProductPage({this.productId});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            FutureBuilder(
              future: _productsRef.doc(widget.productId).get(),
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
                  Map<String, dynamic> documentData = snapshot.data.data();

                  List imageList = documentData["images"];
                  List productSize = documentData["size"];
                  return ListView(
                    children: [
                      ImageSweep(imageList: imageList),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 24),
                        child: Text(
                          "${documentData['name']}" ?? "Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 4.0),
                        child: Text(
                          "\$${documentData['price']}" ?? "Price",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 4.0),
                        child: Text(
                          "${documentData['desc']}" ?? "Descriptions",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10.0),
                        child: Text(
                          "Select Size",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      ProductSize(productSize: productSize),
                    ],
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
              hasTitle: false,
              title: "Home",
              hasBackArrrow: true,
            ),
          ],
        ),
      ),
    );
  }
}
