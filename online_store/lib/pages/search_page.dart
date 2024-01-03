import 'package:flutter/material.dart';
import 'package:online_store/pages/product_details_page.dart';
import '../Model/product.dart';
import '../services/api_services.dart'; // Import your ApiService

class SearchPage extends StatefulWidget {

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final ApiService apiService = ApiService('https://fakestoreapi.com/products');
  int _currentIndex = 0;
  List<Product> displayedProducts = [];


  TextEditingController _searchController = TextEditingController();


  void _searchProducts(String query) async {
    if (query.isEmpty) {
      setState(() {
        displayedProducts = [];
      });
    } else {
      final List<Product> searchResults =
          await apiService.searchProducts(query);
      setState(() {
        displayedProducts = searchResults;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                ),
              ),
            ),
            SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {
                _searchProducts(_searchController.text);
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
      body: displayedProducts.isEmpty
          ? Center(
              child: Text('No results found'),
            )
          : ListView.builder(
            itemCount: displayedProducts.length,
            itemBuilder: (context, index) {
              final product = displayedProducts[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute( builder: (context) => ProductDetailPage(product: product),));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Row(
                    children: [
                      Image.network(
                        product
                            .image,
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              overflow: TextOverflow.ellipsis,
                              // Handle overflow with ellipsis
                              maxLines: 2,
                            ), // Limit the number of lines),
                            SizedBox(height: 8.0),
                            Text('\$${product.price.toStringAsFixed(2)}'),
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
              );
            },
          ),
    );
  }
}
