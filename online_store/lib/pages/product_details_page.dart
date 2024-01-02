// product_detail_page.dart

import 'package:flutter/material.dart';
import '../services/api_services.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.image,
              width: 150, // Set the width of the image
              height: 150, // Set the height of the image
            ),
            SizedBox(height: 16.0),
            Text(
              product.title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(height: 8.0,),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
            ),
            // Add more details or widgets as needed
          ],
        ),
      ),
    );
  }
}
