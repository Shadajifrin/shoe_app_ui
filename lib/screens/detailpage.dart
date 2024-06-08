import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app_ui/controller/shoeprovider.dart';
import 'package:shoe_app_ui/model/shoemodel.dart';

class ShoeDetailPage extends StatelessWidget {
  final Shoe shoe;

  ShoeDetailPage({required this.shoe});

  @override
  Widget build(BuildContext context) {
    final shoeProvider = Provider.of<ShoeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mail_outline),
            onPressed: () {
              // Implement mail functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(shoe.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              shoe.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('\$${shoe.price}', style: TextStyle(fontSize: 20, color: Colors.grey)),
            SizedBox(height: 16),
            ColorOptions(),
            SizeOptions(),
            ShoeDetails(details: shoe.details),
            SizeFitDetails(),
            CompositionCareDetails(),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.grey.shade100, // foreground (text) color
                    ),
                    onPressed: () {
                      shoeProvider.addToBag(shoe);
                    },
                    child: Text('Add to Bag'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.black, // foreground (text) color
                    ),
                    onPressed: () {
                      // Implement Buy Now functionality
                    },
                    child: Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColorOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ColorOption(Colors.black),
        ColorOption(Colors.cyan),
        ColorOption(Colors.purple),
      ],
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;

  ColorOption(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class SizeOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizeOption('5'),
        SizeOption('6'),
        SizeOption('7'),
        SizeOption('8'),
        SizeOption('9'),
      ],
    );
  }
}

class SizeOption extends StatelessWidget {
  final String size;

  SizeOption(this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(size),
      ),
    );
  }
}

class ShoeDetails extends StatelessWidget {
  final String details;

  ShoeDetails({required this.details});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('The Details'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(details),
        ),
      ],
    );
  }
}

class SizeFitDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Size & Fit'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Here are the size and fit details.',
          ),
        ),
      ],
    );
  }
}

class CompositionCareDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Composition & Care'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Here are the composition and care details.',
          ),
        ),
      ],
    );
  }
}
