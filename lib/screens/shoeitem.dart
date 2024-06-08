import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app_ui/controller/shoeprovider.dart';
import 'package:shoe_app_ui/model/shoemodel.dart';
import 'package:shoe_app_ui/screens/detailpage.dart';


class ShoeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoe = Provider.of<Shoe>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ShoeDetailPage(shoe: shoe),
          ),
        );
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  shoe.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  shoe.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text('\$${shoe.price}', style: TextStyle(color: Colors.grey)),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Consumer<Shoe>(
              builder: (ctx, shoe, _) => IconButton(
                icon: Icon(
                  shoe.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: shoe.isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  final shoeProvider = Provider.of<ShoeProvider>(context, listen: false);
                  shoeProvider.toggleFavorite(shoe);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
