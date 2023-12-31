// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

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
}

class Product {
  final String image;
  final double price;
  final String description;

  Product({required this.image, required this.price, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }
}
