
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_firebase/widgets/custom_action_bar.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Products");

  @override
  Widget build(BuildContext context) {
    return Container(
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

              // Collection Data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                // Display the data inside a list view
                return Center(
                  child: ListView(
                    children: snapshot.data.docs.map((document) {
                      return Container(
                        height: 200,
                        color: Colors.red,
                        child: Text("Name: ${document.data()['desc']}"),
                      );
                    }
                  ).toList(),
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
    );
  }
}
