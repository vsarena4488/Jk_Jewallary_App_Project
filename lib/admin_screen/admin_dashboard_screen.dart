import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top App Bar ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  const Text(
                    'DASHBOARD',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B2E9B),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  // Notification Bell with Red Dot
                  Stack(
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        size: 26,
                        color: Color(0xFF1A1A1A),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE53935),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    // ── Stats Row 1: Total Orders + Active Users ──
                    Row(
                      children: const [
                        Expanded(
                          child: _StatCard(label: 'Total Orders', value: '342'),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: _StatCard(
                            label: 'Active Users',
                            value: '1,204',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ── Stats Row 2: Total Products (half width) ──
                    Row(
                      children: const [
                        Expanded(
                          child: _StatCard(
                            label: 'Total Products',
                            value: '86',
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(child: SizedBox()), // empty space
                      ],
                    ),

                    const SizedBox(height: 34),

                    // ── Recent Orders Header ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Recent Orders',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B2E9B),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // ── Order 1: New ──
                    const _RecentOrderTile(
                      initial: 'S',
                      initialBg: Color(0xFFEBE4F7),
                      initialColor: Color(0xFF3B2E9B),
                      orderId: '#ORD-88231',
                      subtitle: '2 mins ago  •  ₹68,998',
                      status: 'New',
                      statusBg: Color(0xFFFFF3E0),
                      statusColor: Color(0xFFF57C00),
                    ),

                    const SizedBox(height: 12),

                    // ── Order 2: Processing ──
                    const _RecentOrderTile(
                      initial: 'J',
                      initialBg: Color(0xFFE8F5E9),
                      initialColor: Color(0xFF2E7D32),
                      orderId: '#ORD-88230',
                      subtitle: '1 hr ago  •  ₹12,450',
                      status: 'Processing',
                      statusBg: Color(0xFFE3F2FD),
                      statusColor: Color(0xFF1976D2),
                    ),

                    const SizedBox(height: 12),

                    // ── Order 3: Delivered ──
                    const _RecentOrderTile(
                      initial: 'R',
                      initialBg: Color(0xFFFFF3E0),
                      initialColor: Color(0xFFF57C00),
                      orderId: '#ORD-88229',
                      subtitle: '3 hrs ago  •  ₹45,999',
                      status: 'Delivered',
                      statusBg: Color(0xFFE8F5E9),
                      statusColor: Color(0xFF2E7D32),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ── Admin Bottom Navigation ──
      bottomNavigationBar: Container(
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
        child: BottomNavigationBar(
          currentIndex: 0, // ✅ Dashboard selected
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF3B2E9B),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              activeIcon: Icon(Icons.grid_view),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Users',
            ),
          ],
        ),
      ),
    );
  }
}

// ── Stat Card Widget ──
class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Recent Order Tile ──
class _RecentOrderTile extends StatelessWidget {
  final String initial;
  final Color initialBg;
  final Color initialColor;
  final String orderId;
  final String subtitle;
  final String status;
  final Color statusBg;
  final Color statusColor;

  const _RecentOrderTile({
    required this.initial,
    required this.initialBg,
    required this.initialColor,
    required this.orderId,
    required this.subtitle,
    required this.status,
    required this.statusBg,
    required this.statusColor,
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
        children: [
          // Avatar Circle with Letter
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(color: initialBg, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              initial,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: initialColor,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Order ID + Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderId,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // Status Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: statusBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
