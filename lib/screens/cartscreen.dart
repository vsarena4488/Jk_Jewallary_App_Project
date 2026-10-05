import 'package:flutter/material.dart';
import 'package:jk_jewallary_project/widgets/user_bottom_nav.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // ── Static cart items ──
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Gold Necklace',
      'price': '₹45,999',
      'image': 'resources/images/products/gold_necklace.jpg',
      'qty': 1,
    },
    {
      'name': 'Gold Earrings',
      'price': '₹22,999',
      'image': 'resources/images/products/gold_earrings.jpg',
      'qty': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top App Bar ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: Color(0xFF1A1A1A),
                  ),
                  const Spacer(),
                  const Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite_border,
                    size: 24,
                    color: Color(0xFF1A1A1A),
                  ),
                ],
              ),
            ),

            // ── Scrollable Cart Items ──
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: _cartItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (_, index) {
                  final item = _cartItems[index];
                  return _CartItemCard(
                    name: item['name'],
                    price: item['price'],
                    image: item['image'],
                    qty: item['qty'],
                    onIncrease: () => setState(() => item['qty']++),
                    onDecrease: () {
                      if (item['qty'] > 1) {
                        setState(() => item['qty']--);
                      }
                    },
                    onDelete: () {},
                  );
                },
              ),
            ),

            // ── Checkout Summary (Bottom Sheet) ──
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
              child: Column(
                children: [
                  // Total Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total Items (2)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                      Text(
                        '₹68,998',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Proceed Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B2E9B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Proceed to Checkout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const UserBottomNav(currentIndex: 3),
    );
  }
}

// ── Cart Item Card ──
class _CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final int qty;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const _CartItemCard({
    required this.name,
    required this.price,
    required this.image,
    required this.qty,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image Box ──
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.diamond, size: 40, color: Colors.grey),
              ),
            ),
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
                const SizedBox(height: 10),

                // Quantity Selector
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Minus
                      GestureDetector(
                        onTap: onDecrease,
                        child: const SizedBox(
                          width: 32,
                          height: 30,
                          child: Icon(
                            Icons.remove,
                            size: 16,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),

                      // Quantity
                      SizedBox(
                        width: 30,
                        child: Center(
                          child: Text(
                            '$qty',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),

                      // Plus
                      GestureDetector(
                        onTap: onIncrease,
                        child: const SizedBox(
                          width: 32,
                          height: 30,
                          child: Icon(
                            Icons.add,
                            size: 16,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Delete Icon ──
          GestureDetector(
            onTap: onDelete,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.delete_outline,
                size: 26,
                color: Color(0xFFD32F2F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
