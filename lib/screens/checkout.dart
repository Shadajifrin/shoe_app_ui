import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final double totalAmount;

  CheckoutPage({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Delivery address'),
              subtitle: Text('San Francisco, 94109\n750 Sutter Street, Apt 3'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Implement navigation to address page
              },
            ),
            Divider(),
            ListTile(
              title: Text('Delivery method'),
              subtitle: Text('2 pieces\nFree Delivery'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Implement navigation to delivery method page
              },
            ),
            Divider(),
            ListTile(
              title: Text('Payment'),
              subtitle: Text('511 Grant Avenue, Flat 23B, San Francisco\nVisa (****2319)'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Implement navigation to payment page
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Promo code',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      // Implement promo code functionality
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: TextStyle(fontSize: 16)),
                Text('\$${(totalAmount).toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery', style: TextStyle(fontSize: 16)),
                Text('\$0.00', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Taxes', style: TextStyle(fontSize: 16)),
                Text('\$${(totalAmount * 0.086).toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('\$${(totalAmount * 1.086).toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black, // text color
                minimumSize: Size(double.infinity, 50), // button size
              ),
              onPressed: () {
                // Implement place order functionality
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
