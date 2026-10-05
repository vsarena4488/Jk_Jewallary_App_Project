import 'package:flutter/material.dart';
import 'package:jk_jewallary_project/admin_screen/admin_dashboard_screen.dart';
import 'package:jk_jewallary_project/admin_screen/admin_products_screen.dart';
import 'package:jk_jewallary_project/admin_screen/admin_profile_screen.dart';
import 'package:jk_jewallary_project/admin_screen/manage_categories_screen.dart';
import 'package:jk_jewallary_project/admin_screen/manage_orders_screen.dart';
import 'package:jk_jewallary_project/admin_screen/manage_users_screen.dart';

class AdminBottomNav extends StatelessWidget {
  final int currentIndex;

  const AdminBottomNav({super.key, this.currentIndex = 1});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget? page;
    switch (index) {
      case 0:
        page = const AdminDashboardScreen();
        break;
      case 1:
        page = const AdminProductsScreen();
        break;
      case 2:
        page = const ManageCategoriesScreen();
        break;
      case 3:
        page = const ManageOrdersScreen();
        break;
      case 4:
        page = const ManageUsersScreen();
        break;
      case 5:
        page = const AdminProfileScreen();
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
      {
        'icon': Icons.grid_view_outlined,
        'active': Icons.grid_view,
        'label': 'Dashboard',
      },
      {
        'icon': Icons.inventory_2_outlined,
        'active': Icons.inventory_2,
        'label': 'Products',
      },
      {
        'icon': Icons.category_outlined,
        'active': Icons.category,
        'label': 'Category',
      },
      {
        'icon': Icons.receipt_long_outlined,
        'active': Icons.receipt_long,
        'label': 'Orders',
      },
      {
        'icon': Icons.person_outline,
        'active': Icons.person,
        'label': 'Users',
      },
      {
        'icon': Icons.account_circle_outlined,
        'active': Icons.account_circle,
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
                        fontSize: 9,
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
