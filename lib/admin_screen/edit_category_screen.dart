import 'package:flutter/material.dart';
import '../widgets/admin_bottom_nav.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({super.key});

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  // ── Prefilled controllers ──
  final TextEditingController _categoryNameController =
      TextEditingController(text: 'Necklaces');
  final TextEditingController _descriptionController = TextEditingController(
    text: 'Elegant necklaces crafted with premium gold and diamonds.',
  );

  // ── Prefilled dropdown ──
  String _selectedColor = 'Purple';

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new,
                      size: 20, color: Color(0xFF1A1A1A)),
                  Spacer(),
                  Text(
                    'Edit Category',
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

                    // ── Current Icon Preview + "+" FAB ──
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3E5F5), // light purple
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.abc,
                                size: 44,
                                color: Color(0xFF8E24AA), // purple
                              ),
                            ),
                          ),
                        ),

                        // Purple "+" FAB (bottom-right of the image box)
                        Positioned(
                          right: -6,
                          bottom: -6,
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B2E9B),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── Category Name ──
                    _label('Category Name'),
                    const SizedBox(height: 10),
                    _textField(controller: _categoryNameController),

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
                          value: _selectedColor,
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
                                value: 'Purple', child: Text('Purple')),
                            DropdownMenuItem(
                                value: 'Blue', child: Text('Blue')),
                            DropdownMenuItem(
                                value: 'Green', child: Text('Green')),
                            DropdownMenuItem(
                                value: 'Orange', child: Text('Orange')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _selectedColor = value);
                            }
                          },
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

            // ── Bottom Actions: Update + Delete ──
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200, width: 1),
                ),
              ),
              child: Column(
                children: [
                  // Update Button
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
                        'Update Category',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Delete Category (text button)
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.opaque,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        'Delete Category',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE53935), // red
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

  // ── Text Field helper ──
  Widget _textField({required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
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