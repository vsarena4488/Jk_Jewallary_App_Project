import 'package:flutter/material.dart';

import '../widgets/admin_bottom_nav.dart';
import 'admin_products_screen.dart';
import 'edit_profile_screen.dart';
import 'manage_orders_screen.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top App Bar ──
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new,
                      size: 20, color: Color(0xFF1A1A1A)),
                  Spacer(),
                  Text(
                    'Admin Profile',
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

            // ── Scrollable Body ──
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // ── Avatar Circle ──
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEBE4F7), // light purple
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'A',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B2E9B),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── Name ──
                    const Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ── Role Chip ──
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBE4F7), // light purple
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Super Admin',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B2E9B),
                        ),
                      ),
                    ),

                    const SizedBox(height: 60),

                    // ── Menu Card ──
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          _menuItem(
                            context: context,
                            icon: Icons.inventory_2_outlined,
                            title: 'Orders',
                            page: const ManageOrdersScreen(),
                          ),
                          _divider(),
                          _menuItem(
                            context: context,
                            icon: Icons.local_offer_outlined,
                            title: 'Products',
                            page: const AdminProductsScreen(),
                          ),
                          _divider(),
                          _menuItem(
                            context: context,
                            icon: Icons.person_outline,
                            title: 'Edit Profile',
                            page: const EditProfileScreen(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 80),

                    // ── Log Out Button ──
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE53935), // red
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.logout,
                                size: 20, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Log Out',
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

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AdminBottomNav(currentIndex: 5),
    );
  }

  // ── Menu Item Row ──
  Widget _menuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget page,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          children: [
            // Icon
            Icon(icon, size: 22, color: const Color(0xFF1A1A1A)),
            const SizedBox(width: 16),
            // Title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            // Arrow
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }

  // ── Thin Divider ──
  Widget _divider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade100,
      indent: 16,
      endIndent: 16,
    );
  }
}
