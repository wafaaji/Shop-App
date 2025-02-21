import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  bool isFavourit;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.isFavourit = false,
  });
}