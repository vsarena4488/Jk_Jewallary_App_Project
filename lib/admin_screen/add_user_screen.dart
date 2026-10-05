import 'package:flutter/material.dart';
import '../widgets/admin_bottom_nav.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  // ── Controllers ──
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // ── Role dropdown (default = User) ──
  String _selectedRole = 'User';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new,
                      size: 20, color: Color(0xFF1A1A1A)),
                  Spacer(),
                  Text(
                    'Add User',
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

                    // ── Profile Picture Upload (dashed) ──
                    Center(
                      child: CustomPaint(
                        painter: _DashedBorderPainter(
                          color: Colors.grey.shade400,
                          radius: 60,
                          gap: 6,
                          dashLength: 5,
                          strokeWidth: 1.2,
                        ),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person_add_alt_1_outlined,
                                size: 32,
                                color: Color(0xFF1A1A1A),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Add Photo',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ── Full Name ──
                    _label('Full Name'),
                    const SizedBox(height: 10),
                    _textField(
                      controller: _nameController,
                      hint: 'e.g., John Doe',
                    ),

                    const SizedBox(height: 20),

                    // ── Email ──
                    _label('Email Address'),
                    const SizedBox(height: 10),
                    _textField(
                      controller: _emailController,
                      hint: 'e.g., john@example.com',
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 20),

                    // ── Phone ──
                    _label('Phone Number'),
                    const SizedBox(height: 10),
                    _textField(
                      controller: _phoneController,
                      hint: 'e.g., +91 98765 43210',
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 20),

                    // ── Role ──
                    _label('Role'),
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
                          value: _selectedRole,
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
                                value: 'User', child: Text('User')),
                            DropdownMenuItem(
                                value: 'Admin', child: Text('Admin')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _selectedRole = value);
                            }
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Password ──
                    _label('Password'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFF3B2E9B), width: 1.5),
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
                    'Save User',
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
      bottomNavigationBar: const AdminBottomNav(currentIndex: 4),
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

  // ── Text Field helper ──
  Widget _textField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: Color(0xFF3B2E9B), width: 1.5),
        ),
      ),
    );
  }
}

// ── Dashed Border Painter (reusable) ──
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
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ));

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