import 'package:flutter/material.dart';

class UpdateOrderStatusScreen extends StatefulWidget {
  const UpdateOrderStatusScreen({super.key});

  @override
  State<UpdateOrderStatusScreen> createState() =>
      _UpdateOrderStatusScreenState();
}

class _UpdateOrderStatusScreenState extends State<UpdateOrderStatusScreen> {
  // ── Status steps ──
  final List<String> _steps = ['New', 'Processing', 'Shipped', 'Delivered'];

  // ── Currently selected step (Processing by default) ──
  int _selectedStep = 1; // 0=New, 1=Processing, 2=Shipped, 3=Delivered

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back_ios_new,
                      size: 20, color: Color(0xFF1A1A1A)),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Update Order Status',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Order #ORD-88231',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(width: 20), // balance
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ── Step List ──
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: _steps.length,
                itemBuilder: (_, index) {
                  final isSelected = index == _selectedStep;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedStep = index),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      margin: const EdgeInsets.only(bottom: 6),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF3F0FC) // light purple
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          // ── Radio Circle ──
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? const Color(0xFF3B2E9B)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF3B2E9B)
                                    : Colors.grey.shade400,
                                width: 1.5,
                              ),
                            ),
                            child: isSelected
                                ? Center(
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                : null,
                          ),

                          const SizedBox(width: 16),

                          // ── Step Label ──
                          Expanded(
                            child: Text(
                              _steps[index],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected
                                    ? const Color(0xFF3B2E9B)
                                    : const Color(0xFF1A1A1A),
                              ),
                            ),
                          ),

                          // ── Step Chip ──
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3E0), // light orange
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Step ${index + 1}',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF57C00), // orange
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // ── Confirm Update Button (Bottom) ──
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B2E9B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Confirm Update',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}