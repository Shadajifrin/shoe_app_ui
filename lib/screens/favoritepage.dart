import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app_ui/controller/shoeprovider.dart';
import 'package:shoe_app_ui/screens/shoeitem.dart';


class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeProvider = Provider.of<ShoeProvider>(context);
    final favoriteShoes = shoeProvider.favoriteShoes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Shoes'),
      ),
      body: favoriteShoes.isEmpty
          ? Center(
              child: Text('No favorites yet!'),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: favoriteShoes.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: favoriteShoes[index],
                child: ShoeItem(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
    );
  }
}
