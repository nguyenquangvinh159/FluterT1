import 'package:flutter/material.dart';
import 'package:flutert1/apps/utils/app_colors.dart';
import 'package:flutert1/apps/widgets/custom_text_field.dart';
import 'package:flutert1/apps/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true; // Trạng thái ẩn/hiện mật khẩu
  bool _rememberMe = false;     // Trạng thái tích chọn điều khoản/Remember me

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // 1. Tiêu đề chào mừng đăng ký
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // 2. Ô nhập Họ và Tên
              CustomTextField(
                controller: _nameController,
                labelText: 'Full Name',
                hintText: 'Brandon Louis',
              ),
              const SizedBox(height: 20),

              // 3. Ô nhập Email
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'Brandonelouis@gmail.com',
              ),
              const SizedBox(height: 20),

              // 4. Ô nhập Mật khẩu
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: '••••••••••••',
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textGrey,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),

              // 5. Hàng chọn Remember me / Đồng ý điều khoản
              GestureDetector(
                onTap: () {
                  setState(() {
                    _rememberMe = !_rememberMe;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: _rememberMe ? AppColors.primary : const Color(0xFFE6E1FF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: _rememberMe
                          ? const Icon(Icons.check, color: Colors.white, size: 16)
                          : null,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Remember me',
                      style: TextStyle(color: AppColors.textGrey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 6. Nút SIGN UP chính
              CustomButton(
                text: 'SIGN UP',
                onPressed: () {
                  print("Name: ${_nameController.text}, Email: ${_emailController.text}");
                },
              ),
              const SizedBox(height: 16),

              // 7. Nút Đăng ký nhanh bằng Google
              CustomButton(
                text: 'SIGN UP WITH GOOGLE',
                backgroundColor: const Color(0xFFD6CDFE).withOpacity(0.3),
                textColor: AppColors.textDark,
                icon: const Icon(Icons.g_mobiledata, size: 30, color: Colors.red),
                onPressed: () {
                  // Xử lý đăng ký bằng Google
                },
              ),
              const SizedBox(height: 24),

              // 8. Dòng chữ quay lại màn hình Đăng nhập
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Vì màn này được mở từ LoginScreen bằng Navigator.push,
                    // chỉ cần pop là quay về đúng màn Login cũ, giữ nguyên trạng thái cũ.
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: AppColors.textGrey),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: AppColors.accentOrange,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}