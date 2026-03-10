import '../../domain/entities/auth_token.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/auth_token_model.dart';
import '../models/user_model.dart';

/// Implementation of [AuthRepository].
/// Handles authentication data operations using local data source.
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl(this.localDatasource);

  @override
  Future<AuthToken?> getStoredAuthToken() async {
    try {
      final tokenModel = await localDatasource.getStoredToken();
      if (tokenModel == null) {
        return null;
      }
      return tokenModel.toEntity();
    } catch (e) {
      // Handle storage errors (e.g., corrupted data, permission issues)
      return null;
    }
  }

  @override
  Future<void> clearAuthToken() async {
    try {
      await localDatasource.clearToken();
    } catch (e) {
      // Log error but don't throw - clearing token should be best-effort
    }
  }

  @override
  Future<bool> checkPhoneExists(String countryCode, String phoneNumber) async {
    try {
      return await localDatasource.checkPhoneExists(countryCode, phoneNumber);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<User> registerUser({
    required String fullName,
    required String countryCode,
    required String phoneNumber,
  }) async {
    try {
      // Generate user ID
      final userId = DateTime.now().millisecondsSinceEpoch.toString();
      
      final user = UserModel(
        id: userId,
        fullName: fullName,
        countryCode: countryCode,
        phoneNumber: phoneNumber,
        createdAt: DateTime.now(),
      );

      await localDatasource.saveUser(user);
      return user.toEntity();
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  @override
  Future<bool> verifyOtp(String countryCode, String phoneNumber, String otp) async {
    try {
      return await localDatasource.verifyOtp(countryCode, phoneNumber, otp);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<AuthToken> generateAuthToken(User user) async {
    try {
      // Generate mock JWT token (30-day expiry)
      final token = 'mock_jwt_${DateTime.now().millisecondsSinceEpoch}';
      final expiresAt = DateTime.now().add(const Duration(days: 30));
      
      final authToken = AuthTokenModel(
        token: token,
        expiresAt: expiresAt,
        phoneNumber: '${user.countryCode}${user.phoneNumber}',
      );

      await localDatasource.saveToken(authToken);
      return authToken.toEntity();
    } catch (e) {
      throw Exception('Failed to generate token: $e');
    }
  }
}

