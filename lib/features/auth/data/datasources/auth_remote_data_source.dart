import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> signUp(String email, String password, String fullName);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<User> login(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } catch (e) {
      throw Exception('Lỗi đăng nhập: $e'); // Thực tế sẽ bắt các exception cụ thể của Firebase
    }
  }

  @override
  Future<User> signUp(String email, String password, String fullName) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Cập nhật tên hiển thị cho user vừa tạo
      await userCredential.user?.updateDisplayName(fullName);

      return userCredential.user!;
    } catch (e) {
      throw Exception('Lỗi đăng ký: $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}