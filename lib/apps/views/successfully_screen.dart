import 'package:flutter/material.dart';
import 'package:flutert1/apps/utils/app_colors.dart';
import 'package:flutert1/apps/widgets/custom_button.dart';

class SuccessfullyScreen extends StatelessWidget {
  const SuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // 1. Tiêu đề Successfully
              const Text(
                'Successfully',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),

              // 2. Đoạn văn bản mô tả
              const Text(
                'Your password has been updated, please change your password regularly to avoid this happening',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textGrey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 50),

              // 3. Hình ảnh minh họa (Placeholder)
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset('assets/images/IMG_HumanSuccess.png'),
                ),
              ),

              const Spacer(),

              // 4. Nút CONTINUE (Đi tiếp vào App hoặc Home)
              CustomButton(
                text: 'CONTINUE',
                onPressed: () {
                  // Thường là vào màn hình chính (Home)
                  print("Chuyển sang màn hình Home Screen");
                },
              ),
              const SizedBox(height: 16),

              // 5. Nút BACK TO LOGIN (Dùng màu tím nhạt)
              CustomButton(
                text: 'BACK TO LOGIN',
                backgroundColor: AppColors.secondaryButton.withOpacity(0.5),
                textColor: AppColors.textDark,
                onPressed: () {
                  // Quay lại màn hình Login và xóa hết các màn cũ trong stack
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}