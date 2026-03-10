/// User entity representing a registered user.
class User {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String countryCode;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.countryCode,
    required this.createdAt,
  });
}



