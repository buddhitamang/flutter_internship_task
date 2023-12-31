import 'package:flutter/material.dart';
import '../services/api_services.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ApiService apiService = ApiService('https://fakestoreapi.com/products');

  int _currentIndex = 0; // Index for the selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        title: TextField(
          onChanged: (value) {
            // Filter the products based on the search input
            setState(() {
              // displayedProducts = apiService.filterProducts(value);
            });
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          // You can add additional actions here if needed
        ],
      ),
      drawer: Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Products',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder<List<Product>>(
            future: apiService.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final List<Product> products = snapshot.data!;
                return Container(
                  height: 200, // Set a fixed height for the horizontal ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(product: product);
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Handle navigation based on the selected tab
          if (_currentIndex == 0) {
            // Navigate to Home
            // Add your navigation logic here
          } else if (_currentIndex == 1) {
            // Navigate to Cart
            // Add your navigation logic here
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        width: 150, // Set a fixed width for each card
        height: 200, // Set a fixed height for each card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.image,
              width: 100, // Set the width of the image
              height: 100, // Set the height of the image
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: [
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 12.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // Add more details or widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
