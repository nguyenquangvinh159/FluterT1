import 'package:flutter/material.dart';
import 'package:flutert1/apps/utils/app_colors.dart';
import 'package:flutert1/apps/widgets/custom_button.dart';
import 'package:flutert1/apps/views/create_password_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Tạo các mảng quản lý controller để lấy dữ liệu mã OTP dễ dàng hơn
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  @override
  // void dispose() {
  //   for (var controller destruct in _controllers) {
  //     destruct.dispose();
  //   }
  //   super.dispose();
  // }

  // Hàm tiện ích tạo nhanh từng ô vuông nhập số OTP
  Widget _buildOtpBox(int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark),
        decoration: const InputDecoration(
          counterText: "", // Ẩn dòng đếm ký tự 0/1 phía dưới
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1 && index < 3) {
            // Tự động nhảy sang ô tiếp theo khi nhập xong 1 số
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            // Tự động quay lại ô trước nếu xóa số
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

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
              // 1. Nút Back quay lại màn hình trước
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: AppColors.textDark, size: 24),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 30),

              // 2. Tiêu đề
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Check Your Email',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.textDark),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'We have sent the code verification to your email address.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: AppColors.textGrey, height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // 3. Hàng chứa 4 ô vuông nhập mã OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => _buildOtpBox(index)),
              ),
              const SizedBox(height: 40),

              // 4. Nhắc nhở gửi lại mã (Resend Code)
              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 12),
                    children: [
                      TextSpan(text: "You didn't receive code? ", style: TextStyle(color: AppColors.textGrey)),
                      TextSpan(
                        text: 'Resend code',
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
              const SizedBox(height: 40),

              // 5. Nút bấm xác nhận để đi tiếp tới trang tạo mật khẩu mới
              CustomButton(
                text: 'CONFIRM',
                onPressed: () {
                  // Gộp chuỗi từ các ô nhập số
                  String otpCode = _controllers.map((c) => c.text).join();
                  print("Mã OTP đã nhập: $otpCode");

                  // Điều hướng sang màn hình thiết lập mật khẩu mới
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreatePasswordScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}