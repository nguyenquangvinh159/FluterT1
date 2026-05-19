import 'package:flutter/material.dart';
import 'package:flutert1/apps/utils/app_colors.dart';
import 'package:flutert1/apps/widgets/custom_text_field.dart';
import 'package:flutert1/apps/widgets/custom_button.dart';
import 'package:flutert1/apps/views/signup_screen.dart';
import 'package:flutert1/apps/views/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

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

              // 1. Tiêu đề chào mừng
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome Back',
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

              // 2. Ô nhập Email
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'Brandonelouis@gmail.com',
              ),
              const SizedBox(height: 20),

              // 3. Ô nhập Mật khẩu
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

              // 4. Hàng Remember me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  // Chuyển sang màn Quên mật khẩu
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 5. Nút Login chính
              CustomButton(
                text: 'LOGIN',
                onPressed: () {
                  print("Email: ${_emailController.text}, Pass: ${_passwordController.text}");
                },
              ),
              const SizedBox(height: 16),

              // 6. Nút Đăng nhập bằng Google
              CustomButton(
                text: 'SIGN IN WITH GOOGLE',
                backgroundColor: const Color(0xFFD6CDFE).withOpacity(0.3),
                textColor: AppColors.textDark,
                icon: const Icon(Icons.g_mobiledata, size: 30, color: Colors.red), // Có thể thay bằng Image.asset khi có ảnh
                onPressed: () {
                  // Xử lý login Google
                },
              ),
              const SizedBox(height: 24),

              // 7. Dòng chữ chuyển hướng sang Đăng ký tài khoản
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                          text: "You don't have an account yet? ",
                          style: TextStyle(color: AppColors.textGrey),
                        ),
                        TextSpan(
                          text: 'Sign up',
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