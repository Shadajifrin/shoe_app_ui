import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app_ui/controller/shoeprovider.dart';
import 'package:shoe_app_ui/model/shoemodel.dart';
import 'package:shoe_app_ui/screens/cartpage.dart';
import 'package:shoe_app_ui/screens/favoritepage.dart';
import 'package:shoe_app_ui/screens/profile.dart';
import 'package:shoe_app_ui/screens/shoeitem.dart';
import 'package:shoe_app_ui/screens/shoppage.dart';

class ShoeGrid extends StatefulWidget {
  const ShoeGrid({super.key});

  @override
  _ShoeGridState createState() => _ShoeGridState();
}

class _ShoeGridState extends State<ShoeGrid> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final shoeProvider = Provider.of<ShoeProvider>(context);
    final shoes = shoeProvider.shoes;

    return Scaffold(
      appBar: _selectedIndex == 0 ? AppBar(
        title:  Center(child: Text('All Shoes')),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        
        ],
          bottom: TabBar(
          controller: _tabController,
          tabs:[
            Tab(text: 'All'),
            Tab(text: 'Lifestyle'),
            Tab(text: 'Jordan'),
            Tab(text: 'Running'),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black, 
          labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.black),
      
        ),
      ) : null,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          buildGrid(shoes), // Home
          ShopPage(), // Shop
          FavoritePage(), // Favorites
          BagPage(), // Bag
          ProfilePage(), // Profile
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildGrid(List<Shoe> shoes) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: shoes.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: shoes[index],
        child: ShoeItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
