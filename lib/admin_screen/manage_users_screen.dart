import 'package:flutter/material.dart';

import '../widgets/admin_bottom_nav.dart';

class ManageUsersScreen extends StatelessWidget {
  const ManageUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Static user data ──
    final List<Map<String, dynamic>> users = [
      {
        'initial': 'J',
        'name': 'John Admin',
        'email': 'john@jewellerystore.com',
        'role': 'Admin',
        'avatarBg': const Color(0xFFF3E5F5), // light purple
        'avatarColor': const Color(0xFF8E24AA), // purple
      },
      {
        'initial': 'A',
        'name': 'Alice Smith',
        'email': 'alice.smith@example.com',
        'role': 'User',
        'avatarBg': const Color(0xFFE8F5E9), // light green
        'avatarColor': const Color(0xFF2E7D32), // green
      },
      {
        'initial': 'M',
        'name': 'Michael Patel',
        'email': 'mpatel99@example.com',
        'role': 'User',
        'avatarBg': const Color(0xFFFFF3E0), // light orange
        'avatarColor': const Color(0xFFF57C00), // orange
      },
      {
        'initial': 'S',
        'name': 'Sarah Connor',
        'email': 'sarah.c@example.com',
        'role': 'User',
        'avatarBg': const Color(0xFFE3F2FD), // light blue
        'avatarColor': const Color(0xFF1976D2), // blue
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
                    'Manage Users',
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

            // ── Search Bar ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by name or email...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 22,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ── Scrollable User List ──
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: users.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final user = users[index];
                  return _UserTile(
                    initial: user['initial'],
                    name: user['name'],
                    email: user['email'],
                    role: user['role'],
                    avatarBg: user['avatarBg'],
                    avatarColor: user['avatarColor'],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ── Floating Add User Button ──
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF3B2E9B),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3B2E9B).withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),

      // ── Admin Bottom Navigation (shared widget) ──
      bottomNavigationBar: const AdminBottomNav(currentIndex: 4),
    );
  }
}

// ── User Tile Widget ──
class _UserTile extends StatelessWidget {
  final String initial;
  final String name;
  final String email;
  final String role;
  final Color avatarBg;
  final Color avatarColor;

  const _UserTile({
    required this.initial,
    required this.name,
    required this.email,
    required this.role,
    required this.avatarBg,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    final isAdmin = role == 'Admin';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // ── Avatar Circle with Letter ──
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: avatarBg, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              initial,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: avatarColor,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // ── Name + Email ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // ── Role Chip ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: isAdmin
                  ? const Color(0xFFF3E5F5) // light purple for Admin
                  : const Color(0xFFE8F5E9), // light green for User
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              role,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isAdmin
                    ? const Color(0xFF8E24AA) // purple
                    : const Color(0xFF2E7D32), // green
              ),
            ),
          ),

          const SizedBox(width: 6),

          // ── More Menu Icon ──
          const Icon(Icons.more_vert, size: 20, color: Colors.grey),
        ],
      ),
    );
  }
}
