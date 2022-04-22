import '../../../domain/entities/user.dart';

class UserDto {
  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.accessToken,
  });

  final int id;
  final String name;
  final String email;
  final String accessToken;

  factory UserDto.fromAPI(Map<String, dynamic> map) {
    return UserDto(
      id: map['Id'] as int,
      name: map['Name'] as String,
      email: map['Email'] as String,
      accessToken: map['Token'] as String,
    );
  }

  User toModel() {
    return User(
      id: id,
      name: name,
      email: email,
    );
  }

  Map<String, dynamic> tokenMap() {
    return {
      'accessToken': accessToken,
    };
  }
}
