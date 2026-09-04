/*
import 'package:app_payku_base_v_0_1/config/config.dart';
import 'package:app_payku_base_v_0_1/features/auth/entities/user.dart';

class Product {
  String id;
  String title;
  double price;
  String description;
  String slug;
  int stock;
  List<String> sizes;
  String gender;
  List<String> tags;
  List<String> images;
  User? user;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.slug,
    required this.stock,
    required this.sizes,
    required this.gender,
    required this.tags,
    required this.images,
    required this.user,
  });
}

class ProductMapper {
  static Product jsonToEntity(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      slug: json['slug'],
      stock: json['stock'],
      sizes: List<String>.from(json['sizes'].map((size) => size)),
      gender: json['gender'],
      tags: List<String>.from(json['tags'].map((tag) => tag)),
      images: List<String>.from(
          json['images'].map(
                  (image) => image.startsWith('http')
                  ? image
                  : '${Environment.apiUrl}/files/product/$image'
          )
      ),
      // user: UserMapper.userJsonToEntity(json['user'])
      user: json['user'] != null ? UserMapper.userJsonToEntity(json['user']) : null
  );
}
*/
