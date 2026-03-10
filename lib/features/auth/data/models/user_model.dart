import '../../domain/entities/user_entity.dart';

/// Data model for user.
/// Extends the domain entity with serialization capabilities.
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.phoneNumber,
    required super.countryCode,
    required super.createdAt,
  });

  /// Creates [UserModel] from JSON.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      countryCode: json['countryCode'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  /// Converts [UserModel] to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Converts domain entity to model.
  factory UserModel.fromEntity(User entity) {
    return UserModel(
      id: entity.id,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      countryCode: entity.countryCode,
      createdAt: entity.createdAt,
    );
  }

  /// Converts model to domain entity.
  User toEntity() {
    return User(
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      countryCode: countryCode,
      createdAt: createdAt,
    );
  }
}



