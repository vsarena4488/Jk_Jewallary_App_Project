import 'package:flutter/material.dart';
import 'package:jk_jewallary_project/widgets/user_bottom_nav.dart';

import 'orderhistoryscreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
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
                    const SizedBox(height: 30),

                    // ── Avatar ──
                    Container(
                      width: 110,
                      height: 110,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEBE4F7), // light purple
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xFF3B2E9B),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── NAME ──
                    const Text(
                      'NAME',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: 1.0,
                      ),
                    ),

                    const SizedBox(height: 50),

                    // ── Menu Items ──
                    _menuItem(context, 'My Orders', const OrderHistoryScreen()),
                    const Divider(height: 1, color: Color(0xFFEEEEEE)),
                    _menuItem(context, 'My Wishlist'),
                    const Divider(height: 1, color: Color(0xFFEEEEEE)),
                    _menuItem(context, 'Edit profile'),

                    const SizedBox(height: 120),

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

      // ── Bottom Navigation ──
      bottomNavigationBar: const UserBottomNav(currentIndex: 4),
    );
  }

  // ── Menu Item Row ──
  static Widget _menuItem(BuildContext context, String title, [Widget? page]) {
    return GestureDetector(
      onTap: page == null
          ? null
          : () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => page));
            },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Row(
          children: [
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
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
