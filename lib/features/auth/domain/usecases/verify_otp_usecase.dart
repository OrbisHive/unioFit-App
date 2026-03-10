import '../repositories/auth_repository.dart';

/// Use case for verifying OTP.
class VerifyOtpUseCase {
  final AuthRepository authRepository;

  VerifyOtpUseCase(this.authRepository);

  /// Verifies OTP for the given phone number.
  /// 
  /// Returns true if OTP is valid, false otherwise.
  Future<bool> call({
    required String countryCode,
    required String phoneNumber,
    required String otp,
  }) async {
    return await authRepository.verifyOtp(
      countryCode,
      phoneNumber,
      otp,
    );
  }
}



