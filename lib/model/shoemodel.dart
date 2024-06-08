import 'package:flutter/material.dart';

class Shoe extends ChangeNotifier {
  final String name;
  final String imageUrl;
  final double price;
  final String details; 
  int count;// Added details property
  bool isFavorite;

  Shoe({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.details,
    this.count=1, // Initialize details
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
