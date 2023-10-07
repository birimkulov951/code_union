// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
      User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
      'user': instance.user,
    };

Tokens _$TokensFromJson(Map<String, dynamic> json) => Tokens(
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['email'] as String,
      json['nickname'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nickname': instance.nickname,
    };
