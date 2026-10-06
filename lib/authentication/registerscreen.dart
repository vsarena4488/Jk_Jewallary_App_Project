import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),

              // REGISTER Title
              const Center(
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B2E9B),
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // FULL NAME
              const Text(
                'FULL NAME',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B2E9B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _fullNameController,
                hint: 'Enter Your Name',
              ),

              const SizedBox(height: 22),

              // EMAIL
              const Text(
                'EMAIL',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B2E9B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _emailController,
                hint: 'Enter Your Phone Number',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 22),

              // PHONE
              const Text(
                'PHONE',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B2E9B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _phoneController,
                hint: 'Enter The Email',
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 22),

              // PASSWORD
              const Text(
                'PASSWORD',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B2E9B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _passwordController,
                hint: 'Enter The Password',
                obscure: true,
              ),

              const SizedBox(height: 22),

              // CONFIRM PASSWORD
              const Text(
                'PASSWORD',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B2E9B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _confirmPasswordController,
                hint: 'Enter The Password',
                obscure: true,
              ),

              const SizedBox(height: 45),

              // REGISTER Button
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B2E9B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ✅ Already have an account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3B2E9B),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 15,
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
