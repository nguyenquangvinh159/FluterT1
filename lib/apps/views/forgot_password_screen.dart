import 'package:flutter/material.dart';
import 'package:flutert1/apps/utils/app_colors.dart';
import 'package:flutert1/apps/widgets/custom_text_field.dart';
import 'package:flutert1/apps/widgets/custom_button.dart';
import 'package:flutert1/apps/views/otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Nút Back góc trên bên trái để quay lại màn Login
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textDark,
                  size: 24,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 30),

              // 2. Tiêu đề màn hình
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'To reset your password, please enter your email address of your account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textGrey,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // 3. Khu vực hiển thị hình minh họa
              Center(
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset('assets/images/IMG_HumanAndKey.png', fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 40),

              // 4. Ô nhập Email để khôi phục mật khẩu
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'Brandonelouis@gmail.com',
              ),
              const SizedBox(height: 32),

              // 5. Nút bấm xác nhận gửi yêu cầu
              CustomButton(
                text: 'RESET PASSWORD',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpScreen()),
                  );
                },
              ),
              const SizedBox(height: 24),

              // 6. Dòng chữ hỗ trợ quay lại nhanh sang màn đăng nhập
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                          text: "Remember your password? ",
                          style: TextStyle(color: AppColors.textGrey),
                        ),
                        TextSpan(
                          text: 'Back to sign in',
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