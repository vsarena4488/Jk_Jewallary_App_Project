import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ── Prefilled controllers ──
  final TextEditingController _nameController = TextEditingController(
    text: 'vishal sarena',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'vsarena@rku.ac.in',
  );
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // ── Password visibility ──
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
                    'Edit Profile',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // ── Avatar with Camera Badge ──
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Avatar Circle
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

                          // Camera Badge (bottom-right)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: const Color(0xFF3B2E9B),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.5,
                                ),
                              ),
                              child: const Icon(
                                Icons.photo_camera,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 36),

                    // ── Full Name ──
                    _label('Full Name'),
                    const SizedBox(height: 10),
                    _textField(controller: _nameController),

                    const SizedBox(height: 22),

                    // ── Email Address ──
                    _label('Email Address'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        suffixIcon: Icon(
                          Icons.lock_outline,
                          size: 20,
                          color: Colors.grey.shade500,
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

                    const SizedBox(height: 22),

                    // ── New Password ──
                    _label('New Password'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _newPasswordController,
                      obscureText: !_showNewPassword,
                      decoration: InputDecoration(
                        hintText: 'Enter new password',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () => setState(
                            () => _showNewPassword = !_showNewPassword,
                          ),
                          child: Icon(
                            _showNewPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                            color: Colors.grey.shade500,
                          ),
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

                    const SizedBox(height: 22),

                    // ── Confirm Password ──
                    _label('Confirm Password'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: !_showConfirmPassword,
                      decoration: InputDecoration(
                        hintText: 'Re-enter new password',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () => setState(
                            () => _showConfirmPassword = !_showConfirmPassword,
                          ),
                          child: Icon(
                            _showConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                            color: Colors.grey.shade500,
                          ),
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

                    const SizedBox(height: 40),

                    // ── Save Changes Button ──
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
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
          borderSide: const BorderSide(color: Color(0xFF3B2E9B), width: 1.5),
        ),
      ),
    );
  }
}
