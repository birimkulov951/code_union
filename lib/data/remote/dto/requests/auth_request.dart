import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class AuthRequest {
  AuthRequest({
    required this.email,
    required this.password,

  });

  final String email;
  final String password;


  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
