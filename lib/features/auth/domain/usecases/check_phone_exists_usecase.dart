import '../repositories/auth_repository.dart';

/// Use case for checking if a phone number is already registered.
class CheckPhoneExistsUseCase {
  final AuthRepository authRepository;

  CheckPhoneExistsUseCase(this.authRepository);

  /// Checks if phone number exists.
  /// 
  /// Returns true if phone is registered, false otherwise.
  Future<bool> call({
    required String countryCode,
    required String phoneNumber,
  }) async {
    return await authRepository.checkPhoneExists(
      countryCode,
      phoneNumber,
    );
  }
}



