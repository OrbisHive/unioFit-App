import '../../domain/entities/auth_token.dart';

/// Data model for authentication token.
/// Extends the domain entity with serialization capabilities.
class AuthTokenModel extends AuthToken {
  const AuthTokenModel({
    required super.token,
    required super.expiresAt,
    super.phoneNumber,
  });

  /// Creates [AuthTokenModel] from JSON.
  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      token: json['token'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      phoneNumber: json['phoneNumber'] as String?,
    );
  }

  /// Converts [AuthTokenModel] to JSON.
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresAt': expiresAt.toIso8601String(),
      'phoneNumber': phoneNumber,
    };
  }

  /// Converts domain entity to model.
  factory AuthTokenModel.fromEntity(AuthToken entity) {
    return AuthTokenModel(
      token: entity.token,
      expiresAt: entity.expiresAt,
      phoneNumber: entity.phoneNumber,
    );
  }

  /// Converts model to domain entity.
  AuthToken toEntity() {
    return AuthToken(
      token: token,
      expiresAt: expiresAt,
      phoneNumber: phoneNumber,
    );
  }
}



