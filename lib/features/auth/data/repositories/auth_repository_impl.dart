import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    final firebaseUser = await remoteDataSource.login(email, password);
    return UserModel.fromFirebaseUser(firebaseUser);
  }

  @override
  Future<UserEntity> signUp(String email, String password, String fullName) async {
    final firebaseUser = await remoteDataSource.signUp(email, password, fullName);
    return UserModel.fromFirebaseUser(firebaseUser);
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
  }
}