import 'package:flutter/material.dart';
import 'package:flutert1/apps/views/logo_screen.dart';
import 'package:flutert1/apps/views/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobspot App',
      debugShowCheckedModeBanner: false, // Ẩn nhãn debug màu đỏ ở góc màn hình

      // Cấu hình Theme chung cho toàn bộ ứng dụng (nếu cần)
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9F9), // Màu nền mặc định sáng
        useMaterial3: true, // Sử dụng các thành phần giao diện chuẩn Material 3
      ),

      // Màn hình đầu tiên xuất hiện khi vừa kích hoạt app (Logo tự đóng sau 1-2s)
      home: const LogoScreen(),

      // Định nghĩa các tuyến đường (Routes) định danh để điều hướng nâng cao
      routes: {
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}