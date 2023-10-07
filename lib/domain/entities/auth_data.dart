import 'package:equatable/equatable.dart';

class AuthData with EquatableMixin {
  const AuthData({
    required this.id,
    required this.email,
    required this.nickname,
    required this.accessToken,
    required this.refresherToken,
  });

  final int id;
  final String email;
  final String nickname;
  final String accessToken;
  final String refresherToken;

  @override
  List<Object> get props => [
        id,
        email,
        nickname,
        accessToken,
        refresherToken,
      ];
}
