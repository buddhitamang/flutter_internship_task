import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../services/api_services.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          var product = cartProvider.cartItems[index];
          return ListTile(

            leading:  Image.network(
              product.image,
              width: 150,
              height: 150,
            ),
            title: Text(product.title),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(
                Icons.delete
              ), onPressed: () {
              cartProvider.removeProductFromCart(product);

            },
            ),

          );
        },
      ),
    );
  }
}
