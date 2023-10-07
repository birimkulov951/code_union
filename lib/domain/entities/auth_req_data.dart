import 'package:equatable/equatable.dart';

class AuthReqData with EquatableMixin {
  const AuthReqData({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
