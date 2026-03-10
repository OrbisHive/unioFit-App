import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case for registering a new user.
class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  /// Registers a new user.
  /// 
  /// Returns the created user.
  Future<User> call({
    required String fullName,
    required String countryCode,
    required String phoneNumber,
  }) async {
    return await authRepository.registerUser(
      fullName: fullName.trim(),
      countryCode: countryCode,
      phoneNumber: phoneNumber,
    );
  }
}



