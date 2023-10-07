import 'package:code_union/domain/entities/auth_req_data.dart';
import 'package:equatable/equatable.dart';

sealed class AuthEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class AuthenticateAuthEvent extends AuthEvent {
  AuthenticateAuthEvent(this.authReqData);

  final AuthReqData authReqData;

  @override
  List<Object> get props => [authReqData];
}
