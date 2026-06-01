import 'package:firebase_auth/firebase_auth.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';

class AuthController {
  // Khai báo UseCase
  late final LoginUseCase _loginUseCase;
  late final SignUpUseCase _signUpUseCase;

  // Khởi tạo các thành phần của Clean Architecture
  AuthController() {
    final remoteDataSource = AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance);
    final repository = AuthRepositoryImpl(remoteDataSource: remoteDataSource);

    _loginUseCase = LoginUseCase(repository);
    _signUpUseCase = SignUpUseCase(repository);
  }

  // Hàm xử lý Đăng nhập
  // Trả về null nếu thành công, trả về chuỗi thông báo nếu có lỗi
  Future<String?> login(String email, String password) async {
    try {
      await _loginUseCase.call(email, password);
      return null; // Không có lỗi
    } catch (e) {
      return 'Sai email hoặc mật khẩu. Vui lòng thử lại!';
    }
  }

  // Hàm xử lý Đăng ký
  Future<String?> signUp(String email, String password, String fullName) async {
    try {
      await _signUpUseCase.call(email, password, fullName);
      return null; // Không có lỗi
    } catch (e) {
      return 'Đăng ký thất bại. Email có thể đã được sử dụng!';
    }
  }
}