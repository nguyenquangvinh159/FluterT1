import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import thư viện lõi
import 'firebase_options.dart';
import 'package:flutert1/features/auth/presentation/pages/logo_screen.dart';
import 'package:flutert1/features/auth/presentation/pages/login_screen.dart';

// Thay đổi hàm main thành bất đồng bộ (async)
void main() async {
  // Đảm bảo Flutter đã sẵn sàng trước khi gọi native code
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobspot App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        useMaterial3: true,
      ),
      home: const LogoScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}