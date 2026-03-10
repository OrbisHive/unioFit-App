import '../models/auth_token_model.dart';
import '../models/user_model.dart';

/// Local data source for authentication token storage.
/// Currently uses in-memory storage (mock implementation).
/// When integrating real storage, replace with SharedPreferences or secure storage.
abstract class AuthLocalDatasource {
  /// Retrieves stored authentication token from local storage.
  Future<AuthTokenModel?> getStoredToken();

  /// Saves authentication token to local storage.
  Future<void> saveToken(AuthTokenModel token);

  /// Clears stored authentication token.
  Future<void> clearToken();

  /// Checks if a phone number is already registered.
  Future<bool> checkPhoneExists(String countryCode, String phoneNumber);

  /// Saves a user to local storage.
  Future<void> saveUser(UserModel user);

  /// Retrieves user by phone number.
  Future<UserModel?> getUserByPhone(String countryCode, String phoneNumber);

  /// Generates a mock OTP (for testing).
  /// In real implementation, this would be sent via SMS.
  Future<String> generateOtp(String countryCode, String phoneNumber);

  /// Verifies OTP.
  Future<bool> verifyOtp(String countryCode, String phoneNumber, String otp);
}

/// Mock implementation of [AuthLocalDatasource].
/// Uses in-memory storage for now.
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  // In-memory storage (mock)
  AuthTokenModel? _storedToken;
  final Map<String, UserModel> _users = {}; // Key: "$countryCode$phoneNumber"
  final Map<String, String> _otpStore = {}; // Key: "$countryCode$phoneNumber", Value: OTP
  final Map<String, DateTime> _otpExpiry = {}; // Key: "$countryCode$phoneNumber"

  @override
  Future<AuthTokenModel?> getStoredToken() async {
    // Simulate network delay for edge case testing
    await Future.delayed(const Duration(milliseconds: 500));
    
    // For now, return null (no stored token) to test registration flow
    // To test authenticated flow, uncomment the line below:
    // return _storedToken;
    
    // To test expired token flow, uncomment the lines below:
    // return AuthTokenModel(
    //   token: 'expired_token',
    //   expiresAt: DateTime.now().subtract(const Duration(days: 1)),
    //   phoneNumber: '+1234567890',
    // );
    
    return null;
  }

  @override
  Future<void> saveToken(AuthTokenModel token) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _storedToken = token;
  }

  @override
  Future<void> clearToken() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _storedToken = null;
  }

  @override
  Future<bool> checkPhoneExists(String countryCode, String phoneNumber) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final key = _getPhoneKey(countryCode, phoneNumber);
    return _users.containsKey(key);
  }

  @override
  Future<void> saveUser(UserModel user) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final key = _getPhoneKey(user.countryCode, user.phoneNumber);
    _users[key] = user;
  }

  @override
  Future<UserModel?> getUserByPhone(String countryCode, String phoneNumber) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final key = _getPhoneKey(countryCode, phoneNumber);
    return _users[key];
  }

  @override
  Future<String> generateOtp(String countryCode, String phoneNumber) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Generate 6-digit OTP
    final otp = (100000 + (DateTime.now().millisecondsSinceEpoch % 900000)).toString();
    final key = _getPhoneKey(countryCode, phoneNumber);
    _otpStore[key] = otp;
    _otpExpiry[key] = DateTime.now().add(const Duration(minutes: 1)); // 1 minute expiry
    return otp;
  }

  @override
  Future<bool> verifyOtp(String countryCode, String phoneNumber, String otp) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final key = _getPhoneKey(countryCode, phoneNumber);
    final storedOtp = _otpStore[key];
    final expiry = _otpExpiry[key];

    if (storedOtp == null || expiry == null) {
      return false;
    }

    if (DateTime.now().isAfter(expiry)) {
      _otpStore.remove(key);
      _otpExpiry.remove(key);
      return false;
    }

    if (storedOtp == otp) {
      _otpStore.remove(key);
      _otpExpiry.remove(key);
      return true;
    }

    return false;
  }

  String _getPhoneKey(String countryCode, String phoneNumber) {
    return '$countryCode$phoneNumber';
  }
}

