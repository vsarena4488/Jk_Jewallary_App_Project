import 'package:flutter/material.dart';

import '../widgets/admin_bottom_nav.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  // ── Controllers ──
  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _categoryNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    'Add Category',
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

            // ── Scrollable Form ──
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),

                    // ── Upload Icon Box (dashed) ──
                    CustomPaint(
                      painter: _DashedBorderPainter(
                        color: Colors.grey.shade400,
                        radius: 12,
                        gap: 6,
                        dashLength: 5,
                        strokeWidth: 1.2,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 40,
                              color: Color(0xFF1A1A1A),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Upload Category Icon',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'PNG, JPG up to 2MB',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ── Category Name ──
                    _label('Category Name'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _categoryNameController,
                      decoration: InputDecoration(
                        hintText: 'e.g., Rings',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF3B2E9B),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Category Color ──
                    _label('Category Color'),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: 'Purple',
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 22,
                            color: Color(0xFF1A1A1A),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1A1A1A),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          items: const [
                            DropdownMenuItem(
                              value: 'Purple',
                              child: Text('Purple'),
                            ),
                            DropdownMenuItem(
                              value: 'Blue',
                              child: Text('Blue'),
                            ),
                            DropdownMenuItem(
                              value: 'Green',
                              child: Text('Green'),
                            ),
                            DropdownMenuItem(
                              value: 'Orange',
                              child: Text('Orange'),
                            ),
                          ],
                          onChanged: (_) {},
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Description ──
                    _label('Description'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Short description about this category...',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF3B2E9B),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // ── Save Button (Bottom) ──
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B2E9B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Save Category',
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

      // ── Admin Bottom Navigation (shared widget) ──
      bottomNavigationBar: const AdminBottomNav(currentIndex: 2),
    );
  }

  // ── Label helper ──
  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A1A1A),
      ),
    );
  }
}

// ── Dashed Border Painter ──
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double gap;
  final double dashLength;
  final double strokeWidth;

  _DashedBorderPainter({
    required this.color,
    this.radius = 12,
    this.gap = 6,
    this.dashLength = 5,
    this.strokeWidth = 1.2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + dashLength;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
