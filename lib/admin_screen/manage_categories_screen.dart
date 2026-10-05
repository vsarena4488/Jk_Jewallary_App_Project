import 'package:flutter/material.dart';

import 'add_category_screen.dart';
import 'edit_category_screen.dart';
import '../widgets/admin_bottom_nav.dart';

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Static category data ──
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Necklaces',
        'count': 78,
        'icon': Icons.abc,
        'iconBg': const Color(0xFFF3E5F5), // light purple
        'iconColor': const Color(0xFF8E24AA), // purple
      },
      {
        'name': 'Rings',
        'count': 142,
        'icon': Icons.circle_outlined,
        'iconBg': const Color(0xFFE3F2FD), // light blue
        'iconColor': const Color(0xFF1976D2), // blue
      },
      {
        'name': 'Earrings',
        'count': 56,
        'icon': Icons.hearing,
        'iconBg': const Color(0xFFE8F5E9), // light green
        'iconColor': const Color(0xFF2E7D32), // green
      },
      {
        'name': 'Bracelets',
        'count': 34,
        'icon': Icons.circle,
        'iconBg': const Color(0xFFFFF3E0), // light orange
        'iconColor': const Color(0xFFF57C00), // orange
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
                    'Manage Categories',
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

            // ── Scrollable Category List ──
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final cat = categories[index];
                  return _CategoryTile(
                    name: cat['name'],
                    count: cat['count'],
                    icon: cat['icon'],
                    iconBg: cat['iconBg'],
                    iconColor: cat['iconColor'],
                  );
                },
              ),
            ),

            // ── Add New Category Button (Bottom) ──
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200, width: 1),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddCategoryScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B2E9B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add, size: 20, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Add New Category',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // ── Admin Bottom Navigation (shared widget) ──
      bottomNavigationBar: const AdminBottomNav(currentIndex: 2),
    );
  }
}

// ── Category Tile Widget ──
class _CategoryTile extends StatelessWidget {
  final String name;
  final int count;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;

  const _CategoryTile({
    required this.name,
    required this.count,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // ── Icon Box ──
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: iconColor),
          ),

          const SizedBox(width: 14),

          // ── Name + Count ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$count Products',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // ── Edit Button ──
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditCategoryScreen()),
              );
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.edit_outlined,
                size: 18,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // ── Delete Button ──
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE), // light red
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.delete_outline,
              size: 18,
              color: Color(0xFFE53935),
            ),
          ),
        ],
      ),
    );
  }
}
