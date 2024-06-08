import 'package:flutter/material.dart';
import 'package:shoe_app_ui/model/shoemodel.dart';


class ShoeProvider with ChangeNotifier {
  final List<Shoe> _shoes = [
    Shoe(name: 'Nike Air Max 90', imageUrl: 'assets/images/image1.jpeg', price: 150.0,details: 'The Nike Air Max 90 is an iconic sneaker first released in 1990. Renowned for its bold design and comfort, it features a visible Air unit in the heel, providing superior cushioning. '),
    Shoe(name: 'Nike AF1 Shadow', imageUrl: 'assets/images/image2.jpeg', price: 130.0, details: 'he Nike AF1 Shadow is a contemporary twist on the classic Air Force 1, known for its layered design and playful aesthetics. This iteration features double the branding'),
    Shoe(name: 'Nike Court Legacy', imageUrl: 'assets/images/image3.jpeg', price: 150.0,details: 'The Nike Court Legacy pays homage to the timeless tennis style with a modern twist. This shoe features clean, classic lines and premium stitching, embodying a retro-inspired look that blends effortlessly with contemporary fashion.'),
    Shoe(name: 'Nike Court Legacy Next', imageUrl: 'assets/images/images4.jpeg', price: 100.0,details: 'The Nike Court Legacy Next continues the tradition of classic tennis-inspired style with enhanced features for modern comfort and performance. This iteration boasts a sleek.'),
  ];

  List<Shoe> get shoes => _shoes;
  List<Shoe> get favoriteShoes => _shoes.where((shoe) => shoe.isFavorite).toList();

  void toggleFavorite(Shoe shoe) {
    shoe.toggleFavoriteStatus();
    notifyListeners();
  }
   final List<Shoe> _bag = [];

 
    List<Shoe> get bag => _bag;
     void addToBag(Shoe shoe) {
    if (_bag.contains(shoe)) {
      increaseCount(shoe);
    } else {
      _bag.add(shoe..count = 1);
    }
    notifyListeners();
  }

  void removeFromBag(Shoe shoe) {
    _bag.remove(shoe);
    notifyListeners();
  }

  void clearBag() {
    _bag.clear();
    notifyListeners();
  }

  void increaseCount(Shoe shoe) {
    shoe.count++;
    notifyListeners();
  }

  void decreaseCount(Shoe shoe) {
    if (shoe.count > 1) {
      shoe.count--;
    } else {
      removeFromBag(shoe);
    }
    notifyListeners();
  }
}