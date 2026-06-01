import 'package:flutter/material.dart';
import 'package:flutert1/features/auth/presentation/utils/app_colors.dart';
import 'package:flutert1/features/auth/presentation/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          // Dùng LayoutBuilder để xử lý cuộn khi màn hình quá nhỏ (tránh tràn viền)
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Tên ứng dụng ở góc trên bên phải
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Jobspot',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

                        // 2. Khu vực hiển thị Hình ảnh minh họa (Placeholder)
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset('assets/images/IMG_human.png', fit: BoxFit.contain),
                          ),
                        ),
                        const SizedBox(height: 40),

                        // 3. Phần Tiêu đề dạng RichText để đổi màu từng chữ
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                            children: [
                              TextSpan(
                                text: 'Find Your\n',
                                style: TextStyle(color: AppColors.textDark),
                              ),
                              TextSpan(
                                text: 'Dream Job\n',
                                style: TextStyle(color: AppColors.accentOrange, decoration: TextDecoration.underline),
                              ),
                              TextSpan(
                                text: 'Here!',
                                style: TextStyle(color: AppColors.textDark),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // 4. Đoạn văn bản mô tả ngắn
                        const Text(
                          'Explore all the most exciting job roles based on your interest and study major.',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textGrey,
                            height: 1.5,
                          ),
                        ),

                        // Sử dụng Spacer để đẩy nút bấm xuống sát đáy màn hình
                        const Spacer(),

                        // 5. Nút bấm hình tròn chuyển màn hình ở góc dưới bên phải
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              // Sử dụng Navigator cơ bản để chuyển sang màn hình Login
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                              );
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
