import '../entities/auth_token.dart';
import '../entities/user_entity.dart';

/// Abstract repository for authentication operations.
/// This defines the contract that data layer implementations must follow.
abstract class AuthRepository {
  /// Checks if there is a valid authentication token stored on the device.
  /// Returns [AuthToken] if valid token exists, null otherwise.
  Future<AuthToken?> getStoredAuthToken();

  /// Clears the stored authentication token.
  Future<void> clearAuthToken();

  /// Checks if a phone number is already registered.
  /// Returns true if phone exists, false otherwise.
  Future<bool> checkPhoneExists(String countryCode, String phoneNumber);

  /// Registers a new user with name and phone number.
  /// Returns the created user.
  Future<User> registerUser({
    required String fullName,
    required String countryCode,
    required String phoneNumber,
  });

  /// Verifies OTP for phone number.
  /// Returns true if OTP is valid, false otherwise.
  Future<bool> verifyOtp(String countryCode, String phoneNumber, String otp);

  /// Generates and stores authentication token for user.
  /// Returns the generated token.
  Future<AuthToken> generateAuthToken(User user);
}

