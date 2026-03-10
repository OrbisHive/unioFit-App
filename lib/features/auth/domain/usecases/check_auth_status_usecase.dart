import '../repositories/auth_repository.dart';

/// Use case for checking authentication status.
/// Determines if user should be redirected to dashboard or registration.
class CheckAuthStatusUseCase {
  final AuthRepository authRepository;

  CheckAuthStatusUseCase(this.authRepository);

  /// Checks authentication status and returns the result.
  /// 
  /// Returns:
  /// - [AuthStatus.authenticated] if valid token exists
  /// - [AuthStatus.expired] if token exists but is expired
  /// - [AuthStatus.unauthenticated] if no token exists
  Future<AuthStatusResult> call() async {
    try {
      final token = await authRepository.getStoredAuthToken();

      if (token == null) {
        return const AuthStatusResult(
          status: AuthStatus.unauthenticated,
        );
      }

      if (token.isExpired) {
        return AuthStatusResult(
          status: AuthStatus.expired,
          phoneNumber: token.phoneNumber,
        );
      }

      return const AuthStatusResult(
        status: AuthStatus.authenticated,
      );
    } catch (e) {
      // Handle errors (e.g., slow network, storage issues)
      return const AuthStatusResult(
        status: AuthStatus.unauthenticated,
      );
    }
  }
}

/// Authentication status enum.
enum AuthStatus {
  authenticated,
  expired,
  unauthenticated,
}

/// Result of authentication status check.
class AuthStatusResult {
  final AuthStatus status;
  final String? phoneNumber; // For pre-filling phone number entry

  const AuthStatusResult({
    required this.status,
    this.phoneNumber,
  });
}

