import 'package:flutter/material.dart';

import '../widgets/admin_bottom_nav.dart';

class ManageOrdersScreen extends StatelessWidget {
  const ManageOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Static order data ──
    final List<Map<String, dynamic>> orders = [
      {
        'orderId': '#ORD-88231',
        'customer': 'John Doe',
        'items': 2,
        'date': '23 Jul, 2026',
        'amount': '₹68,998',
        'status': 'New',
        'buttonText': 'Update Status',
      },
      {
        'orderId': '#ORD-88230',
        'customer': 'Alice Smith',
        'items': 1,
        'date': '22 Jul, 2026',
        'amount': '₹12,450',
        'status': 'Processing',
        'buttonText': 'Update Status',
      },
      {
        'orderId': '#ORD-88229',
        'customer': 'Michael Patel',
        'items': 3,
        'date': '20 Jul, 2026',
        'amount': '₹45,999',
        'status': 'Delivered',
        'buttonText': 'View Details',
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
                    'Manage Oder',
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

            // ── Scrollable Order List ──
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: orders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (_, index) {
                  final order = orders[index];
                  return _OrderCard(
                    orderId: order['orderId'],
                    customer: order['customer'],
                    items: order['items'],
                    date: order['date'],
                    amount: order['amount'],
                    status: order['status'],
                    buttonText: order['buttonText'],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ── Admin Bottom Navigation (shared widget) ──
      bottomNavigationBar: const AdminBottomNav(currentIndex: 3),
    );
  }
}

// ── Order Card Widget ──
class _OrderCard extends StatelessWidget {
  final String orderId;
  final String customer;
  final int items;
  final String date;
  final String amount;
  final String status;
  final String buttonText;

  const _OrderCard({
    required this.orderId,
    required this.customer,
    required this.items,
    required this.date,
    required this.amount,
    required this.status,
    required this.buttonText,
  });

  // ── Status chip background color ──
  Color get _statusBg {
    switch (status) {
      case 'New':
        return const Color(0xFFFFF3E0); // light orange
      case 'Processing':
        return const Color(0xFFE3F2FD); // light blue
      case 'Delivered':
        return const Color(0xFFE8F5E9); // light green
      default:
        return Colors.grey.shade200;
    }
  }

  // ── Status chip text color ──
  Color get _statusColor {
    switch (status) {
      case 'New':
        return const Color(0xFFF57C00); // orange
      case 'Processing':
        return const Color(0xFF1976D2); // blue
      case 'Delivered':
        return const Color(0xFF2E7D32); // green
      default:
        return Colors.grey;
    }
  }

  // ── Button style based on status ──
  bool get _isPrimaryButton => status != 'Delivered';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Row 1: Order ID + Status Chip ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderId,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$customer  •  $items Item${items > 1 ? 's' : ''}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: _statusBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: _statusColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ── Row 2: Date + Amount + Button ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 36),

              // Amount
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B2E9B),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Button
              _isPrimaryButton
                  ? ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B2E9B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        minimumSize: Size.zero,
                        elevation: 0,
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        minimumSize: Size.zero,
                        foregroundColor: const Color(0xFF1A1A1A),
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
