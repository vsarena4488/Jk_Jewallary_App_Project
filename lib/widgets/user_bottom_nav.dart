import 'package:flutter/material.dart';
import 'package:jk_jewallary_project/screens/cartscreen.dart';
import 'package:jk_jewallary_project/screens/homescreen.dart';
import 'package:jk_jewallary_project/screens/jewelleryscreen.dart';
import 'package:jk_jewallary_project/screens/profilescreen.dart';
import 'package:jk_jewallary_project/screens/wishlistscreen.dart';

class UserBottomNav extends StatelessWidget {
  final int currentIndex;

  const UserBottomNav({super.key, this.currentIndex = 0});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget? page;
    switch (index) {
      case 0:
        page = const HomeScreen();
        break;
      case 1:
        page = const JewelleryScreen();
        break;
      case 2:
        page = const WishlistScreen();
        break;
      case 3:
        page = const CartScreen();
        break;
      case 4:
        page = const ProfileScreen();
        break;
    }

    if (page != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => page!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home_outlined, 'active': Icons.home, 'label': 'Home'},
      {
        'icon': Icons.diamond_outlined,
        'active': Icons.diamond,
        'label': 'Jewellery',
      },
      {
        'icon': Icons.favorite_border,
        'active': Icons.favorite,
        'label': 'Wishlist',
      },
      {
        'icon': Icons.shopping_cart_outlined,
        'active': Icons.shopping_cart,
        'label': 'Cart',
      },
      {
        'icon': Icons.person_outline,
        'active': Icons.person,
        'label': 'Profile',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == currentIndex;

              return Expanded(
                child: InkWell(
                  onTap: () => _onTap(context, index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isSelected
                            ? item['active'] as IconData
                            : item['icon'] as IconData,
                        size: 22,
                        color: isSelected
                            ? const Color(0xFF3B2E9B)
                            : Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['label'] as String,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                          color: isSelected
                              ? const Color(0xFF3B2E9B)
                              : Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
