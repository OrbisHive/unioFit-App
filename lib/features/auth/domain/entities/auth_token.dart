/// Authentication token entity.
/// Represents the authentication state of the user.
class AuthToken {
  final String token;
  final DateTime expiresAt;
  final String? phoneNumber; // For pre-filling phone number entry

  const AuthToken({
    required this.token,
    required this.expiresAt,
    this.phoneNumber,
  });

  /// Checks if the token is still valid (not expired).
  bool get isValid {
    return DateTime.now().isBefore(expiresAt);
  }

  /// Checks if the token is expired.
  bool get isExpired {
    return DateTime.now().isAfter(expiresAt);
  }
}



