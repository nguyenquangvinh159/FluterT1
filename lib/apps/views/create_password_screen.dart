import 'package:flutter/material.dart';
import 'package:flutert1/apps/utils/app_colors.dart';
import 'package:flutert1/apps/widgets/custom_text_field.dart';
import 'package:flutert1/apps/widgets/custom_button.dart';
import 'package:flutert1/apps/views/successfully_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
              // 1. Nút Back quay lại
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: AppColors.textDark, size: 24),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 30),

              // 2. Tiêu đề chào mừng
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Create New Password',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.textDark),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Your new password must be different from previous used passwords.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: AppColors.textGrey, height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // 3. Ô nhập Mật khẩu mới
              CustomTextField(
                controller: _passwordController,
                labelText: 'New Password',
                hintText: '••••••••••••',
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: AppColors.textGrey, size: 20),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),

              // 4. Ô nhập lại để xác nhận Mật khẩu mới
              CustomTextField(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: '••••••••••••',
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility, color: AppColors.textGrey, size: 20),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 40),

              // 5. Nút bấm hoàn thành (Đưa người dùng về màn hình đăng nhập)
              CustomButton(
                text: 'RESET PASSWORD',
                onPressed: () {
                  if (_passwordController.text == _confirmPasswordController.text) {
                    // Khi đổi mật khẩu xong, chuyển sang màn Successfully
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SuccessfullyScreen()),
                    );
                  } else {
                    print("Mật khẩu không trùng khớp!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}