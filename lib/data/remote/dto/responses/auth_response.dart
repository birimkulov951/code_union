import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class AuthResponse {
  const AuthResponse(
    this.tokens,
    this.user,
  );

  final Tokens tokens;
  final User user;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@JsonSerializable()
class Tokens {
  const Tokens(
    this.accessToken,
    this.refreshToken,
  );

  final String accessToken;
  final String refreshToken;

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
}

@JsonSerializable()
class User {
  const User(
    this.id,
    this.email,
    this.nickname,
  );

  final int id;
  final String email;
  final String nickname;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

//      {
//          "tokens": {
//              "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..",
//              "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.."
//          },
//          "user": {
//              "id": 31,
//              "email": "maripbekoff@gmail.com",
//              "nickname": "maripbekoff"
//          }
//      }
