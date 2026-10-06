import 'package:flutter/material.dart';
import 'package:jk_jewallary_project/widgets/user_bottom_nav.dart';

import 'jewelleryscreen.dart';
import 'productdetailsscreen.dart';
import 'searchfilterscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    // ── Top Bar ──
                    Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 26,
                          color: Color(0xFF1A1A1A),
                        ),
                        const SizedBox(width: 14),
                        const Text(
                          'Hi, User',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.notifications_none,
                          size: 26,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ── Search Bar ──
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search jewellery...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 22,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SearchFilterScreen()),
                            ),
                            icon: const Icon(Icons.tune, color: Colors.grey, size: 22),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),

                    // ── Categories Header ──
                    _sectionHeader(context, 'Categories'),

                    const SizedBox(height: 16),

                    // ── Categories Row ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _CategoryItem(
                          label: 'Rings',
                          icon: Icons.circle_outlined,
                        ),
                        _CategoryItem(label: 'Necklaces', icon: Icons.abc),
                        _CategoryItem(label: 'Earrings', icon: Icons.hearing),
                        _CategoryItem(label: 'Bracelets', icon: Icons.circle),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── New Arrivals Header ──
                    _sectionHeader(context, 'New Arrivals'),

                    const SizedBox(height: 16),

                    // ── New Arrivals Horizontal Scroll ──
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          _ProductCard(
                            imageUrl: 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=400',
                            name: 'Gold Necklace',
                            price: '₹45,999',
                          ),
                          SizedBox(width: 14),
                          _ProductCard(
                            imageUrl: 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=400',
                            name: 'Diamond Ring',
                            price: '₹25,999',
                          ),
                          SizedBox(width: 14),
                          _ProductCard(
                            imageUrl: 'https://images.unsplash.com/photo-1610694955371-d4a3e0ce4b52?w=400',
                            name: 'Emerald Pendant',
                            price: '₹32,999',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ── Popular Products Header ──
                    _sectionHeader(context, 'Popular Products'),

                    const SizedBox(height: 16),

                    // ── Popular Products Horizontal Scroll ──
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          _ProductCard(
                            imageUrl: 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=400',
                            name: 'Gold Earrings',
                            price: '₹22,999',
                          ),
                          SizedBox(width: 14),
                          _ProductCard(
                            imageUrl: 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=400',
                            name: 'Silver Bracelet',
                            price: '₹15,999',
                          ),
                          SizedBox(width: 14),
                          _ProductCard(
                            imageUrl: 'https://images.unsplash.com/photo-1598560917505-59a3ad559071?w=400',
                            name: 'Rose Gold Ring',
                            price: '₹18,999',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const UserBottomNav(currentIndex: 0),
    );
  }

  // ── Section Header with "View All" ──
  Widget _sectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const JewelleryScreen()),
          ),
          child: const Text(
            'View All',
            style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3B2E9B),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Category Item Widget ──
class _CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const _CategoryItem({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Icon(icon, size: 28, color: const Color(0xFF1A1A1A)),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }
}

// ── Product Card Widget (Fixed Width for Horizontal Scroll) ──
class _ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const _ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProductDetailsScreen()),
      ),
      borderRadius: BorderRadius.circular(12),
      child: Container(
      width: 160, // ✅ Fixed width for horizontal scroll
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + wishlist icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Container(
                  height: 130,
                  width: double.infinity,
                  color: const Color(0xFFF5F5F5),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.diamond, size: 40, color: Colors.grey),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          // Details
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B2E9B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
