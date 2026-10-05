import 'package:flutter/material.dart';
import 'package:jk_jewallary_project/widgets/admin_bottom_nav.dart';

import 'add_product_screen.dart';
import 'delete_product_screen.dart';
import 'edit_product_screen.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Static product list ──
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Gold Necklace',
        'price': '₹45,999',
        'stock': 12,
        'icon': Icons.circle_outlined,
        'iconColor': const Color(0xFFD4AF37), // gold
      },
      {
        'name': 'Diamond Ring',
        'price': '₹25,999',
        'stock': 8,
        'icon': Icons.circle_outlined,
        'iconColor': const Color(0xFF64B5F6), // blue
      },
      {
        'name': 'Gold Earrings',
        'price': '₹22,999',
        'stock': 15,
        'icon': Icons.hearing,
        'iconColor': const Color(0xFFD4AF37), // gold
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top App Bar ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: Color(0xFF1A1A1A),
                  ),
                  Spacer(),
                  Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  Spacer(),
                  SizedBox(width: 20), // balance
                ],
              ),
            ),

            // ── Scrollable Product List ──
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (_, index) {
                  final product = products[index];
                  return _ProductTile(
                    name: product['name'],
                    price: product['price'],
                    stock: product['stock'],
                    icon: product['icon'],
                    iconColor: product['iconColor'],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ── Floating Add Button ──
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddProductScreen()),
          );
        },
        backgroundColor: const Color(0xFF3B2E9B),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),

      // ── Admin Bottom Navigation (4 items) ──
      bottomNavigationBar: const AdminBottomNav(currentIndex: 1),
    );
  }
}

// ── Product Tile Widget ──
class _ProductTile extends StatelessWidget {
  final String name;
  final String price;
  final int stock;
  final IconData icon;
  final Color iconColor;

  const _ProductTile({
    required this.name,
    required this.price,
    required this.stock,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image Placeholder Box ──
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Icon(icon, size: 34, color: iconColor)),
          ),

          const SizedBox(width: 14),

          // ── Details ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),

                // Price
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),

                // Stock
                Text(
                  'Stock: $stock',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 12),

                // Edit + Delete Buttons
                Row(
                  children: [
                    _actionButton(
                      context: context,
                      label: 'Edit',
                      bg: const Color(0xFFEBE4F7),
                      textColor: const Color(0xFF3B2E9B),
                      page: const EditProductScreen(),
                    ),
                    const SizedBox(width: 8),
                    _actionButton(
                      context: context,
                      label: 'Delete',
                      bg: const Color(0xFFFFEBEE),
                      textColor: const Color(0xFFE53935),
                      page: const DeleteProductScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Small Action Button ──
  Widget _actionButton({
    required BuildContext context,
    required String label,
    required Color bg,
    required Color textColor,
    required Widget page,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
