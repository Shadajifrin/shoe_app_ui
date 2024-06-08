import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg'), // Add your image path here
                ),
                SizedBox(width: 16),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildProfileOption(context, 'View Profile'),
            _buildProfileOption(context, 'Orders'),
            _buildProfileOption(context, 'Wishlist'),
            _buildProfileOption(context, 'Gift Cards'),
            SizedBox(height: 24),
            Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildProfileOption(context, 'Shipping & Returns'),
            _buildProfileOption(context, 'Help'),
            _buildProfileOption(context, 'Contact Us'),
            _buildProfileOption(context, 'About Us'),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.grey.shade200, // text color
                  minimumSize: Size(double.infinity, 50), // button size
                ),
                onPressed: () {
                  // Implement logout functionality
                },
                child: Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Implement navigation to respective pages
          },
        ),
        Divider(),
      ],
    );
  }
}
