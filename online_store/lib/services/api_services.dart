// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/product.dart';

class ApiService {
  final String apiUrl;


  ApiService(this.apiUrl);

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    final List<Product> allProducts = await fetchProducts();
    final List<Product> searchResults = allProducts
        .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return searchResults;
  }
}


