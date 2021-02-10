import 'package:flutter/material.dart';

class ProductOne extends StatelessWidget {
  final String imageUrl, name, price;

  const ProductOne({this.imageUrl, this.name, this.price});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Container(
        height: 270,
        width: 180,
        color: Colors.green,
        child: Column(
          children: [
            Image.network(
              imageUrl,
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            ),
            Text(
              name,
            ),
            Text(
              price,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
