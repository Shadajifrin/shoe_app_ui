import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app_ui/controller/shoeprovider.dart';
import 'package:shoe_app_ui/screens/checkout.dart';


class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeProvider = Provider.of<ShoeProvider>(context);
    final bagItems = shoeProvider.bag;

    double getTotalAmount() {
      double total = 0.0;
      for (var shoe in bagItems) {
        total += shoe.price * shoe.count;
      }
      return total;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Bag'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              shoeProvider.clearBag();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bagItems.length,
              itemBuilder: (context, index) {
                final shoe = bagItems[index];
                return Column(
                  children: [
                    ListTile(
                      leading: Image.asset(shoe.imageUrl, fit: BoxFit.cover),
                      title: Text(shoe.name),
                      subtitle: Text('\$${shoe.price.toStringAsFixed(2)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.shade200,
                            child: IconButton(
                              icon: Icon(Icons.remove, size: 16),
                              onPressed: () {
                                shoeProvider.decreaseCount(shoe);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('${shoe.count}'),
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.shade200,
                            child: IconButton(
                              icon: Icon(Icons.add, size: 16),
                              onPressed: () {
                                shoeProvider.increaseCount(shoe);
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              shoeProvider.removeFromBag(shoe);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Total: \$${(shoe.price * shoe.count).toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Bag Total: \$${getTotalAmount().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
  padding: const EdgeInsets.all(16.0),
  child: SizedBox(
    width: double.infinity, // Set width to match parent width
    height: 50.0, // Set desired height
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.black, // text color
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CheckoutPage(totalAmount: getTotalAmount()),
          ),
        );
      },
      child: Text('Checkout'),
    ),
  ),
),

        ],
      ),
    );
  }
}
