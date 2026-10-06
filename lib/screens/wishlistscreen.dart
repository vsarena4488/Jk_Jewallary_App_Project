import 'package:flutter/material.dart';
import 'package:jk_jewallary_project/widgets/user_bottom_nav.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wishlist'), centerTitle: true),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, size: 56, color: Color(0xFF3B2E9B)),
            SizedBox(height: 12),
            Text('Your wishlist is empty.'),
          ],
        ),
      ),
      bottomNavigationBar: const UserBottomNav(currentIndex: 2),
    );
  }
}
